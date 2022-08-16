class TasksController < ApplicationController
  before_action :find_params, only: [:show, :edit, :update, :destroy]
  def list
    @tasks = Task.all
  end

  def show; end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(form_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit; end

  def update
    @task.update(form_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to '/tasks', status: :see_other
  end

  private

  def find_params
    @task = Task.find(params[:id])
  end

  def form_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
