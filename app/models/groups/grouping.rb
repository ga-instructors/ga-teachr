module Groups
  class Grouping < ActiveRecord::Base
    belongs_to :cohort
    has_many :groups, foreign_key: :groups_grouping_id

    accepts_nested_attributes_for :groups

    def name
      self[:name] ||= "Groups for #{(created_at || DateTime.now).to_date}"
    end

    def populate!
      count = cohort.students.count
      cohort.students.shuffle.in_groups_of(count/3, false).each_with_index do |students, i|
        group = groups.new(name: "Group #{i+1}")
        group.students = students
      end
    end

  end
end
