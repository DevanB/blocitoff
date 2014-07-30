class TodosController < ApplicationController
  def index
    @todos = Todo.find(params[:id])
  end
end
