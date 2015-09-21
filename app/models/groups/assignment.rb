class Groups::Assignment < ActiveRecord::Base
  belongs_to :group, class_name: Groups::Group, foreign_key: :groups_group_id
  belongs_to :student
end
