class TodosController < ApplicationController

  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:success] = "Todo has been successfully saved!"
      redirect_to todo_path(@todo)
    else
      render 'new'
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      flash[:success] = "Todo was successfully updated"
      redirect_to todo_path(@todo)
    else
      render 'edit'
    end
  end

  def show
    @todo = Todo.find(params[id])
  end

  def destroy

  end

  private
  def todo_params
    params.require(:todo).permit(:name, :description)
  end
end
