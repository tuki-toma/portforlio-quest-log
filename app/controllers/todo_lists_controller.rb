class TodoListsController < ApplicationController
  def index
    @todo_lists_daily = current_user.todo_lists.daily
    @todo_lists_weekly = current_user.todo_lists.weekly
    @todo_lists_monthly = current_user.todo_lists.monthly
    @todo_lists_unique = current_user.todo_lists.unique
  end

  def new
    @todo_list = TodoList.new
    @todo_list.build_task(user:current_user)
  end

  def create
    @todo_list = TodoList.new(todo_list_params)
    @todo_list.task.user = current_user
    if @todo_list.save
      redirect_to todo_lists_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @todo_list = TodoList.find(params[:id])
    @task = @todo_list.task
  end

  def update
    @todo_list = TodoList.find(params[:id])
    @todo_list.task.user = current_user
    if @todo_list.update(todo_list_params)
      redirect_to todo_lists_path
    else
      render :edit,status: :unprocessable_entity
    end
  end

  private

  def todo_list_params
    params.require(:todo_list).permit(
      :deadline,
      :repeat_rule,
      task_attributes: [:id,:name,:description]
    )
  end
end