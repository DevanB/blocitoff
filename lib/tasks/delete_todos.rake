task delete_todos: :environment do
  Todo.where("created_at <= ?", 7.days.ago).destroy_all
end