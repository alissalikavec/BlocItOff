class TodosController < ApplicationController
  respond_to :html, :js

  def index
  	@todos = policy_scope(Todo)
    @todo = Todo.new
    authorize @todos
  end

def show
  	@todo = Todo.find(params[:id])
  end

  def new
  	@todo = Todo.new
    authorize @todo
  end

  def create
  	@todo = Todo.new(todo_params.merge(user: current_user))
    @new_todo = Todo.new
    authorize @todo
  	if @todo.save
  		flash[:notice] = "Todo was saved."
  	else
  		flash[:error] = "There was an error saving the todo. Please try again."
  		render :new
  	end
  end

  def destroy
    @todo = Todo.find(params(:id))
    authorize @todo

    if @todo.destroy
      flash[:notice] = "Todo was removed."
    else
      flash[:error] = "Todo couldn't be deleted. Try again."
    end

    # respond_with(@todo) do |f|
     # f.html { redirect_to todos_path }
    #end
  end

  private
  def todo_params
    params.require(:todo).permit(:description, :completed)
  end
end
