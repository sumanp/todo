class TasksController < ApplicationController
  before_action :owned_task, only: [:edit, :update, :destroy]
  before_action :set_task, only: [:show]

  def index
    @tasks = current_user.tasks.not_done.order_by_position
  end

  def show
  end

  def new
    @task = current_user.tasks.build
  end

  def edit
  end

  def create
    @task = current_user.tasks.build(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path }
        format.json { render :edit, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def sort
    params[:span].each_with_index do |id, index|
       Task.where(id: id).update_all(position: index + 1) # Update code
    end
    respond_to { |format| format.js }
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :due_at, :completed, :user_id, :span)
  end

  def owned_task
    @task = Task.find(params[:id])
    unless @task.user.id == current_user.id
      flash[:alert] = "This task doesn't belong to you!"
      redirect_to root_path
    end
  end
end
