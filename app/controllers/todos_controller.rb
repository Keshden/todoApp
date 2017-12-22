class TodosController < ApplicationController
  before_action :set_todo, only: [:destroy, :edit, :show, :update]

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
  end

  def update
    if @todo.update(todo_params)
      flash[:success] = "Todo was successfully updated"
      redirect_to todo_path(@todo)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @todo.destroy
    flash[:warning] = "Todo was deleted Successfully"
    redirect_to todos_path
  end

  private
  def todo_params
    params.require(:todo).permit(:name, :description)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
end
