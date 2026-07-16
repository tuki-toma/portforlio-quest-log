class HabitsController < ApplicationController
  def index
    @habits = current_user.habits.active
  end

  def new
    @habit = Habit.new
    @habit.build_task(user:current_user)
  end

  def create
    @habit = Habit.new(habit_params)
    @habit.task.user = current_user
    if @habit.save
      redirect_to habits_path
    else
      render :new,status: :unprocessable_entity
    end
  end    

  def edit
    @habit = Habit.find(params[:id])
    @task = @habit.task
  end

  def update
    @habit = Habit.find(params[:id])
    @habit.task.user = current_user
    if @habit.update(habit_params)
      redirect_to habits_path
    else
      render :edit ,status: :unprocessable_entity
    end
  end    

  def destroy
    begin
      @habit = Habit.find(params[:id])
      @habit.update!(status: :archived)
      redirect_to habits_path,notice:"習慣を削除しました"
    rescue
      redirect_to habits_path,alert:"削除に失敗しました"
    end
  end

  private

  def habit_params
    params.require(:habit).permit(
      :end_date,
      task_attributes: [:id,:name,:description]
      )
  end
end