class Todo < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :description
  validates_presence_of :user_id

  after_save :delete_completed_todo

  def expiration_date
    self.created_at+1.week
  end

  def delete_completed_todo
    if self.completed
      self.destroy
    end
  end
end
