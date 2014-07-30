class Todo < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :description
  validates_presence_of :user_id
end
