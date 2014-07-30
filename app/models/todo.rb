class Todo < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :description
  validates_presence_of :user_id

  def days_left
    self.created_at-1.week
  end
end
