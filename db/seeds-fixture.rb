# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

nycampus = Campus.create!({
  name: 'New York City',
  timezone: 'Eastern Time (US & Canada)',
  locale: 'en',
  address_street: '10 E 21st St',
  address_city: 'New York City',
  address_state: 'New York',
  address_zip: '10010',
  address_country: 'USA',
  description: "New York City is"
})

wdi = Course.create!({
  name: 'Web Development Immersive'
})

jaden = Employee.create!({
  first_name: 'Jaden',
  last_name: 'Carver',
  title: 'WDI Instructor',
  email: 'jaden@generalassemb.ly',
  campus: nycampus,
  debug: true,
  admin: true,
  user: User.new(password: 'tmoat')
})

pan = Employee.create!({
  first_name: 'Pan',
  last_name: 'Wangperawong',
  title: 'WDI Instructor',
  email: 'pan@generalassemb.ly',
  campus: nycampus,
  debug: false,
  admin: false,
  user: User.new(password: 'test')
})

dennis = Employee.create!({
  first_name: 'Dennis',
  last_name: 'Liaw',
  title: 'WDI Associate',
  email: 'dennis.liaw@generalassemb.ly',
  campus: nycampus,
  debug: false,
  admin: false,
  user: User.new(password: 'test')
})

bobby = Employee.create!({
  first_name: 'Bobby',
  last_name: 'King',
  title: 'WDI Associate',
  email: 'bobby.king@generalassemb.ly',
  campus: nycampus,
  debug: false,
  admin: false,
  user: User.new(password: 'test')
})

hayley = Employee.create!({
  first_name: 'Hayley',
  last_name: 'Noveck',
  title: 'Course Producer',
  email: 'hayley.noveck@generalassemb.ly',
  campus: nycampus,
  debug: false,
  admin: false,
  user: User.new(password: 'test')
})

meir = Employee.create!({
  first_name: 'Meir',
  last_name: 'Snyder',
  title: 'Teaching Assistant',
  email: 'meir.snyder@generalassemb.ly',
  campus: nycampus,
  debug: false,
  admin: false,
  user: User.new(password: 'test')
})

pluto = Cohort.create!({
  course: wdi,
  name: 'Pluto',
  campus: nycampus,
  github_repo: 'ga-students/pluto',
  begins_at: DateTime.new(2015, 8, 10, 0, 0, 0),
  ends_at: DateTime.new(2015, 11, 2, 23, 59, 59)
})
pluto.instructors.create!(employee: jaden)
pluto.instructors.create!(employee: pan)
pluto.associates.create!(employee: dennis)
pluto.associates.create!(employee: bobby)
pluto.producers.create!(employee: hayley)
pluto.assistants.create!(employee: meir)

Student.create!({
  first_name: "Jacob",
  last_name: "Shemkovitz",
  email: "jacob.shemkovitz@gmail.com",
  github_username: "jforjacob",
  registrations: [Student::Registration.new(cohort: pluto, status: "enrolled")],
  user: User.new(password: 'test'),
  cohort: pluto
})
Student.create!({
  first_name: "Andres",
  last_name: "Carter",
  email: "carter.marino@gmail.com",
  registrations: [Student::Registration.new(cohort: pluto, status: "enrolled")],
  user: User.new(password: 'test'),
  cohort: pluto
})
Student.create!({
  first_name: "Steph",
  last_name: "Nathai",
  email: "steffi.nathai@gmail.com",
  github_username: "StephNathai",
  registrations: [Student::Registration.new(cohort: pluto, status: "enrolled")],
  user: User.new(password: 'test'),
  cohort: pluto
})
Student.create!({
  first_name: "Meiji",
  last_name: "Chen",
  email: "meiji.chen@gmail.com",
  github_username: "meijichen",
  registrations: [Student::Registration.new(cohort: pluto, status: "enrolled")],
  user: User.new(password: 'test'),
  cohort: pluto
})
Student.create!({
  first_name: "Nick",
  last_name: "Marshall",
  email: "nialbima@gmail.com",
  github_username: "nialbima",
  registrations: [Student::Registration.new(cohort: pluto, status: "enrolled")],
  user: User.new(password: 'test'),
  cohort: pluto
})
Student.create!({
  first_name: "Jennifer",
  last_name: "Yien",
  email: "jenniferllwu@gmail.com",
  github_username: "jenniferyien",
  registrations: [Student::Registration.new(cohort: pluto, status: "enrolled")],
  user: User.new(password: 'test'),
  cohort: pluto
})
Student.create!({
  first_name: "Brian",
  last_name: "Deutsch",
  email: "bgdeutsch@gmail.com",
  registrations: [Student::Registration.new(cohort: pluto, status: "enrolled")],
  user: User.new(password: 'test'),
  cohort: pluto
})
Student.create!({
  first_name: "Edward",
  last_name: "Petner",
  email: "edward.petner@gmail.com",
  registrations: [Student::Registration.new(cohort: pluto, status: "enrolled")],
  user: User.new(password: 'test'),
  cohort: pluto
})
Student.create!({
  first_name: "Esther",
  github_username: "estherzinn",
  last_name: "Zinn",
  email: "bionicfemme@me.com",
  registrations: [Student::Registration.new(cohort: pluto, status: "enrolled")],
  user: User.new(password: 'test'),
  cohort: pluto
})
Student.create!({
  first_name: "Harrison",
  last_name: "Riddell",
  email: "harrison.e.riddell@gmail.com",
  github_username: "HarrisonRiddell",
  registrations: [Student::Registration.new(cohort: pluto, status: "enrolled")],
  user: User.new(password: 'test'),
  cohort: pluto
})
Student.create!({
  first_name: "Victoria",
  last_name: "Donnelly",
  email: "vic.n.d1@gmail.com",
  github_username: "nealado",
  registrations: [Student::Registration.new(cohort: pluto, status: "enrolled")],
  user: User.new(password: 'test'),
  cohort: pluto
})
Student.create!({
  first_name: "Yuka",
  last_name: "Nagai",
  email: "yukanagai@gmail.com",
  github_username: "yukanagai",
  registrations: [Student::Registration.new(cohort: pluto, status: "enrolled")],
  user: User.new(password: 'test'),
  cohort: pluto
})
Student.create!({
  first_name: "Christopher",
  last_name: "Smith",
  email: "smithopher87@gmail.com",
  registrations: [Student::Registration.new(cohort: pluto, status: "enrolled")],
  user: User.new(password: 'test'),
  cohort: pluto
})
Student.create!({
  first_name: "Jaskaranjit",
  last_name: "Singh",
  email: "singhjaskar1@gmail.com",
  registrations: [Student::Registration.new(cohort: pluto, status: "enrolled")],
  user: User.new(password: 'test'),
  cohort: pluto
})
Student.create!({
  first_name: "Pierre",
  last_name: "Cajuste",
  email: "pcajuste@gmail.com",
  github_username: "pcajuste",
  registrations: [Student::Registration.new(cohort: pluto, status: "enrolled")],
  user: User.new(password: 'test'),
  cohort: pluto
})
Student.create!({
  first_name: "Joy",
  last_name: "Morgan",
  email: "tesoro1021@gmail.com",
  github_username: "morga147",
  registrations: [Student::Registration.new(cohort: pluto, status: "enrolled")],
  user: User.new(password: 'test'),
  cohort: pluto
})
Student.create!({
  first_name: "Pamela",
  last_name: "Nevins",
  email: "pamela.nevins@gmail.com",
  github_username: "pnev",
  registrations: [Student::Registration.new(cohort: pluto, status: "enrolled")],
  user: User.new(password: 'test'),
  cohort: pluto
})
Student.create!({
  first_name: "Zoe",
  last_name: "Sachs",
  email: "zoesachs1@gmail.com",
  github_username: "zoesachs",
  registrations: [Student::Registration.new(cohort: pluto, status: "enrolled")],
  user: User.new(password: 'test'),
  cohort: pluto
})
Student.create!({
  first_name: "Eric",
  last_name: "Kim",
  email: "erickim91@gmail.com",
  registrations: [Student::Registration.new(cohort: pluto, status: "enrolled")],
  user: User.new(password: 'test'),
  cohort: pluto
})
Student.create!({
  first_name: "Salvatore",
  last_name: "Fanara",
  email: "sfanara@gmail.com",
  github_username: "tfbkny",
  registrations: [Student::Registration.new(cohort: pluto, status: "enrolled")],
  user: User.new(password: 'test'),
  cohort: pluto
})
Student.create!({
  first_name: "Mohamed",
  last_name: "Elgendy",
  email: "elgendi.mohamed@gmail.com",
  github_username: "moelgendy",
  registrations: [Student::Registration.new(cohort: pluto, status: "enrolled")],
  user: User.new(password: 'test'),
  cohort: pluto
})
Student.create!({
  first_name: "Raquel",
  last_name: "Hosein",
  email: "raquelhosein12@gmail.com",
  github_username: "raquelhosein",
  registrations: [Student::Registration.new(cohort: pluto, status: "enrolled")],
  user: User.new(password: 'test'),
  cohort: pluto
})
Student.create!({
  first_name: "Matt",
  last_name: "Morrisey",
  email: "mattydevicce@gmail.com",
  github_username: "mattydevicce",
  registrations: [Student::Registration.new(cohort: pluto, status: "enrolled")],
  user: User.new(password: 'test'),
  cohort: pluto
})
Student.create!({
  first_name: "Calvin",
  last_name: "Yeung",
  email: "calyeung92@gmail.com",
  registrations: [Student::Registration.new(cohort: pluto, status: "enrolled")],
  user: User.new(password: 'test'),
  cohort: pluto
})
Student.create!({
  first_name: "Josh",
  last_name: "Bubis",
  email: "joshbubis@gmail.com",
  registrations: [Student::Registration.new(cohort: pluto, status: "enrolled")],
  user: User.new(password: 'test'),
  cohort: pluto
})
