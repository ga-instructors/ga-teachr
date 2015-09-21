class Groups::Group < ActiveRecord::Base
  belongs_to :grouping
  has_many :assignments, foreign_key: :groups_group_id
  has_many :students, through: :assignments

  accepts_nested_attributes_for :assignments
end
