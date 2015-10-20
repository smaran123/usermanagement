class TasksController < ApplicationController
  before_action :set_task, :except => [:index,:new,:create]
 
  def new
    @task = Task.new
    @tasks = Task.where("user_id = #{current_user.id}") if current_user.admin == false
  end

  def index
    @tasks = Task.all
  end

  def create
    @task = Task.new(task_params)
    @task.status = 'pending'
    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def update

    if @task.update(task_params)
      redirect_to tasks_path
    else
      render :edit
    end
  end 

  def show
  
  end

  def edit
    
  end
  
  def destroy
    if @task.destroy
      redirect_to tasks_path
    end
  end
  
  private
  
  def set_task
    @task=Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit!
  end
end
