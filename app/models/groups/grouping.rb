module Groups
  class Grouping < ActiveRecord::Base
    belongs_to :cohort
    has_many :groups, foreign_key: :groups_grouping_id

    accepts_nested_attributes_for :groups
    attr_accessor :target_group_size
    attr_accessor :target_group_strategy

    def name
      self[:name] ||= "Groups for #{(created_at || DateTime.now).to_date}"
    end

    def populate!
      count = cohort.students.count
      target_group_size = (count/(target_group_size.try(:to_i) || 5)).ceil
      cohort.students.shuffle.in_groups_of(target_group_size, false).each_with_index do |students, i|
        group = groups.new(name: "Group #{i+1}")
        group.students = students
      end
    end

  end
end
