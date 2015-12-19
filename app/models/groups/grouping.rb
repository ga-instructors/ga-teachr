module Groups
  class Grouping < ActiveRecord::Base
    belongs_to :cohort
    has_many :groups, foreign_key: :groups_grouping_id

    accepts_nested_attributes_for :groups
    attr_accessor :target_group_size
    attr_accessor :target_group_count
    attr_accessor :target_group_strategy

    def name
      self[:name] ||= "Groups for #{(created_at || DateTime.now).to_date}"
    end

    def target_group_size
      if @target_group_count
        (cohort.students.count.to_f / @target_group_count.to_i).ceil
      else @target_group_size || 5
      end
    end

    def populate!(&block)
      block = :shuffle.to_proc unless block_given?
      scope = cohort.students.instance_eval(&block)
      scope.in_groups_of(target_group_size, false).each_with_index do |students, i|
        group = groups.new(name: "Group #{i+1}")
        group.students = students
      end
    end

  end
end
