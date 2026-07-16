class CompletionsController < ApplicationController
  def create
    begin
      @completion = Completion.new(completion_params)
      p completion_params
      p params[:task_id]
      @completion.save!
      redirect_to tasks_path
    rescue
      alert:"タスクを完了できませんでした"
    end
  end

  private

  def completion_params
    params.permit(
      :task_id,
      :created_at,
      :completed_at
    )
  end
end