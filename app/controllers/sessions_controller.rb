class SessionsController < ApplicationController

def create
    worker = Worker.from_omniauth(env["omniauth.auth"])
    session[:worker_id] = worker.id
    redirect_to root_path
  end

  def destroy
    session[:worker_id] = nil
    redirect_to root_path
  end



end
