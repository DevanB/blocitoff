module DeleteTodos
  def self.run
    Todo.where("created_at <= ?", 1.week.ago).destroy_all
  end
end