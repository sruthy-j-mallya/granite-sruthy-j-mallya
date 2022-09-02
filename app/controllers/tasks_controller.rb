# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :load_task!, only: %i[show update destroy]

  def index
    tasks = Task.all.as_json(include: { assigned_user: { only: %i[name id] } })
    respond_with_json({ tasks: tasks })
  end

  def create
    task = Task.new(task_params)
    task.save!
    respond_with_success(t("successfully_created", entity: "Task"))
  end

  def show
    render
  end

  def update
    @task.update!(task_params)
    respond_with_success(t("successfully_updated", entity: "Task"))
  end

  def destroy
    @task.destroy!
    respond_with_json
  end

  private

    def load_task!
      @task = Task.find_by!(slug: params[:slug])
    end

    def task_params
      params.require(:task).permit(:title, :assigned_user_id)
    end
end
