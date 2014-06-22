class TodoController < ApplicationController
  def index
  	@todos = Todo.all
  end

def show
  	@todo = Todo.find(params[:id])
  end

  def new
  	@todo = Todo.new
  end

  def create
  	@todo = Todo.new(todo_params)
  	if @todo.save
  		flash[:notice] = "Todo was saved."
  		redirect_to todo_index_path
  	else
  		flash[:error] = "There was an error saving the todo. Please try again."
  		render :new
  	end
  end
end
