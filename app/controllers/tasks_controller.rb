class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all     # GET /restaurants
  end

  def show                # GET /restaurants/:id
  end

  def new                 # GET /restaurants/new
    @task = Task.new
  end

  def create              # POST /restaurants
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit                # GET /restaurants/:id/edit
  end

  def update              # PATCH /restaurants/:id
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy             # DELETE /restaurants/:id
    @task.destroy
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
