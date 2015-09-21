module Groups
  class Grouping < ActiveRecord::Base
    belongs_to :cohort
    has_many :groups, foreign_key: :groups_grouping_id

    accepts_nested_attributes_for :groups
  end
end
