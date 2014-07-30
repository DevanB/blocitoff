class TodosController < ApplicationController
  def index
    @todos = current_user.todos
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = current_user.todos.build(todo_params)

    if @todo.save
      redirect_to todos_path, notice: "Your todo has been created successfully."
    else
      flash[:alert] = "Error creating todo. Please try again."
      render :new
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:description)
  end
end
