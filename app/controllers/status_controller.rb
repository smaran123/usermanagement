class StatusController < ApplicationController

  def index
      @user = current_user
    @task = current_user.tasks
    
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update(status_params)
      redirect_to tasks_path
    else
      render :edit
    end
  end
  
  private
  
  def status_params
    params.require(:task).permit!
  end
  
end
