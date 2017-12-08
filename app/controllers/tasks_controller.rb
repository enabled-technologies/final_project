class TasksController < ApplicationController
  def index
    @tasks = Task.all

    render("tasks/index.html.erb")
  end

  def show
    @task = Task.find(params[:id])

    render("tasks/show.html.erb")
  end

  def new
    @task = Task.new

    render("tasks/new.html.erb")
  end

  def create
    @list = List.new
    @list.id = [:list_id]
    @task = Task.new

    @task.name = params[:name]
    @task.prioriti = params[:prioriti]
    @task.duedate = params[:duedate]
    @task.status = params[:status]
    @task.list_id = params[:list_id]

    save_status = @task.save

    if save_status == true
      redirect_to("/lists/#{@task.list_id}", :notice => "Task created successfully.")
    else
      render("tasks/new.html.erb")
    end
  end

  def edit
    @task = Task.find(params[:id])

    render("tasks/edit.html.erb")
  end

  def update
    @list = List.new
    @task = Task.find(params[:id])

    @task.name = params[:name]
    @task.prioriti = params[:prioriti]
    @task.duedate = params[:duedate]
    @task.status = params[:status]
    @task.list_id = params[:list_id]

    save_status = @task.save

    if save_status == true
      redirect_to("/tasks/#{@task.id}", :notice => "Task updated successfully.")
    else
      render("tasks/edit.html.erb")
    end
  end
  
  def edit_from_lists
    @task = Task.find(params[:id])

    render("tasks/edit_from_lists.html.erb")
  end

  def update_task_from_lists
    @list = List.new
    @task = Task.find(params[:id])

    @task.name = params[:name]
    @task.prioriti = params[:prioriti]
    @task.duedate = params[:duedate]
    @task.status = params[:status]
    @task.list_id = params[:list_id]

    save_status = @task.save

    if save_status == true
      redirect_to("/lists/#{@task.list_id}", :notice => "Task updated successfully.")
    else
      render("tasks/edit.html.erb")
    end
  end

  def destroy
    @task = Task.find(params[:id])

    @task.destroy

    if URI(request.referer).path == "/tasks/#{@task.id}"
      redirect_to("/", :notice => "Task deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Task deleted.")
    end
  end
end
