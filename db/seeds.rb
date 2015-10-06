require 'pg'

db = PG.connect(dbname: 'ga-quiz_development')

nycampus = Campus.create!({
  name: 'New York City',
  timezone: 'Eastern Time (US & Canada)',
  locale: 'en',
  address_street: '10 E 21st St',
  address_city: 'New York City',
  address_state: 'New York',
  address_code: '10010',
  address_country: 'USA',
  description: "New York City is"
})

wdi = Course.create!(name: 'Web Development Immersive', abbrev: 'WDI')
pmi = Course.create!(name: 'Project Management Immersive', abbrev: 'PMI')
uxdi = Course.create!(name: 'User Experience Design Immersive', abbrev: 'UXDI')

legacy_map = {}
db.exec_params("SELECT * FROM groups").each do |group|
  if group["name"] =~ /^WDI/
    course = wdi
  elsif group["name"] =~ /^PMI/
    course = pmi
  else
    warn "Group #{group} was not imported"
    next
  end
  name_data = /^(WDI |PMI )(.*)$/.match(group["name"])
  legacy_map[Cohort.create!({
    name: name_data ? name_data[2] : group["name"],
    course: course,
    campus: nycampus,
    begins_at: group["start_at"] || group["created_at"],
    ends_at: group["end_at"] || group["updated_at"]
  })] = group["id"]
end

Cohort.all.each do |cohort|

  members = db.exec_params("SELECT * FROM group_members LEFT JOIN users ON users.id = group_members.user_id WHERE group_id = $1", [legacy_map[cohort]])
  members.each do |member|

    if member["role"] == "student" && student = Student.find_by(email: member["email"])
      cohort.registrations.create!(student: student)
    elsif ["instructor", "member"].include?(member["role"]) && employee = Employee.find_by(email: member["email"])
      cohort.associates.create!(employee: employee)
    else
      first_name, *last_name = member["name"].split(' ')
      props = {
          first_name: first_name,
          last_name: last_name.join(' '),
          email: member["email"],
          user: User.create!(password_digest: member["password_digest"]),
        }
      case member["role"]
      when "student"
        legacy_map[cohort.students.create!(props)] = member["user_id"]
      when "instructor"
        props["title"] = "#{cohort.course.abbrev} Instructor"
        props[:campus] = nycampus
        legacy_map[employee = Employee.create!(props)] = member["user_id"]
        legacy_map[cohort.instructors.create!(employee: employee)] = member["id"]
      when "member"
        props["title"] = "Instructional Associate"
        props[:campus] = nycampus
        legacy_map[employee = Employee.create!(props)] = member["user_id"]
        legacy_map[cohort.associates.create!(employee: employee)] = member["id"]
      end
    end

  end

end

Cohort.all.each do |cohort|
  quizzes = db.exec_params("SELECT * FROM quizzes_quizzes WHERE group_id = $1", [legacy_map[cohort]])
  quizzes.each do |quiz|
    survey = cohort.surveys.create!({
      title: quiz["name"],
      introduction: quiz["introduction"],
      ordinal: quiz["ordinal"]
    })
    legacy_map[survey] = quiz["id"]
    questions = db.exec_params("SELECT * FROM quizzes_questions WHERE quiz_id = $1", [quiz["id"]])
    questions.each do |question|
      survey_question = survey.questions.create!({
        ordinal: question["ordinal"],
        prompt: question["question"],
        open_ended: question["open_ended"]
      })
      legacy_map[survey_question] = question["id"]
      options = db.exec_params("SELECT * FROM quizzes_question_options WHERE question_id = $1", [legacy_map[survey_question]])
      options.each do |option|
        survey_question.options.create!({
          label: option["label"],
          value: option["grade"]
        })
      end

    end
  end
end

Employee.find_by(email: 'jaden@generalassemb.ly').user.update(password: 'tmoat')
