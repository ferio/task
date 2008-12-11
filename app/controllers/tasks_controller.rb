class TasksController < ApplicationController
  def index
    list
    render :action => :list
  end
  
  def list
    @tasks=Task.find(:all,:order=>'date desc')
  end
  
  def new
    @task=Task.new
  end
  
  def create
    @task=Task.new params[:task]
    if @task.save
      redirect_to tasks_path
    else
      render :action => :new
    end
  end
  
  def destroy
    @task = Task.find params[:id]
    @task.destroy
    redirect_to tasks_path
  end
  
  def edit
    @task = Task.find params[:id]
  end
  
  def update
    @task = Task.find params[:id]
    if @task.update_attributes(params[:task])
      redirect_to tasks_path
    else
      render :action => :edit, :id => params[:id]
    end
  end

end
