class TasksController < ApplicationController
  def index   #show all tasks
    @tasks = Task.all
  end
  

  def show  #show task by id
    @task = Task.find(params[:id])
  end

  def new 
    @task = Task.new
  end
  
  def edit  
    @task = Task.find(params[:id])
  end

  def create  #create new task
    @task = Task.new(task_params)
    @task.created_at = Date.current
    if @task.save
      redirect_to @task
    else
      render 'new'
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.updated_at = Date.current
    if @task.update(task_params)
      redirect_to @task
    else
      render 'edit'
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path
  end
  

  private

  def task_params
    params.require(:task).permit(:title, :text)
  end
end
