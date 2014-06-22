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
  	@todo = Todo.new(params.require(:todo).permit(:title, :body))
  	if @todo.save
  		flash[:notice] = "Todo was saved."
  		redirect_to @todo
  	else
  		flash[:error] = "There was an error saving the todo. Please try again."
  		render :new
  	end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update_attributes(params.require(:todo).permit(:title, :body))
      flash[:notice] = "Todo was updated."
      redirect_to @todo
    else
      flash[:error] = "There was an error saving the todo. Please try again."
      render :edit
    end
  end
end
