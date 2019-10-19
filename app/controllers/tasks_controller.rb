class TasksController < ApplicationController

  def index   #show all tasks
    @tasks = Task.where("user_id = ?", current_user.id)
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
    modify_task_params = task_params
    modify_task_params[:user_id] = current_user.id
    @task = Task.new(modify_task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Exercise was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @task = Task.find(params[:id])
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
    params.require(:task).permit(:title, :text, :date_finish)
  end
end
