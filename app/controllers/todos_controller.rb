class TodosController < ApplicationController

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

  end

  def update

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
