class ListsController < ApplicationController
  def index
    @lists = List.all

    render("lists/index.html.erb")
  end

  def show
    @list = List.find(params[:id])

    render("lists/show.html.erb")
  end

  def new
    @list = List.new

    render("lists/new.html.erb")
  end

  def create
    @list = List.new

    @list.name = params[:name]
    @list.category = params[:category]
    @list.prioriti = params[:prioriti]
    @list.duedate = params[:duedate]
    @list.status = params[:status]
    @list.user_id = params[:user_id]

    save_status = @list.save

    if save_status == true
      redirect_to("/lists/#{@list.id}", :notice => "List created successfully.")
    else
      render("lists/new.html.erb")
    end
  end

  def edit
    @list = List.find(params[:id])

    render("lists/edit.html.erb")
  end

  def update
    @list = List.find(params[:id])

    @list.name = params[:name]
    @list.category = params[:category]
    @list.prioriti = params[:prioriti]
    @list.duedate = params[:duedate]
    @list.status = params[:status]
    @list.user_id = params[:user_id]

    save_status = @list.save

    if save_status == true
      redirect_to("/lists/#{@list.id}", :notice => "List updated successfully.")
    else
      render("lists/edit.html.erb")
    end
  end
  
  def edit_from_my_lists
    @list = List.find(params[:id])

    render("lists/edit_from_my_lists.html.erb")
  end
  
  def update_from_my_lists
    @list = List.find(params[:id])

    @list.name = params[:name]
    @list.category = params[:category]
    @list.prioriti = params[:prioriti]
    @list.duedate = params[:duedate]
    @list.status = params[:status]
    @list.user_id = params[:user_id]

    save_status = @list.save

    if save_status == true
      redirect_to("/my_lists", :notice => "List updated successfully.")
    else
      render("lists/edit.html.erb")
    end
  end

  def destroy
    @list = List.find(params[:id])

    @list.destroy

    if URI(request.referer).path == "/lists/#{@list.id}"
      redirect_to("/", :notice => "List deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "List deleted.")
    end
  end
  
  def my_lists
    @my_lists = List.where(:user_id => current_user.id)
    
    render("lists/my_lists.html.erb")
    
  end

end
