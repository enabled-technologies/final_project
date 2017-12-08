class CollaborationsController < ApplicationController
  def index
    @collaborations = Collaboration.all

    render("collaborations/index.html.erb")
  end

  def show
    @collaboration = Collaboration.find(params[:id])

    render("collaborations/show.html.erb")
  end

  def new
    @collaboration = Collaboration.new

    render("collaborations/new.html.erb")
  end

  def create
    @collaboration = Collaboration.new

    @collaboration.list_id = params[:list_id]
    @collaboration.user_id = params[:user_id]

    save_status = @collaboration.save

    if save_status == true
      redirect_to("/lists/#{@collaboration.list_id}", :notice => "Collaboration created successfully.")
    else
      render("collaborations/new.html.erb")
    end
  end

  def edit
    @collaboration = Collaboration.find(params[:id])

    render("collaborations/edit.html.erb")
  end

  def update
    @collaboration = Collaboration.find(params[:id])

    @collaboration.list_id = params[:list_id]
    @collaboration.user_id = params[:user_id]

    save_status = @collaboration.save

    if save_status == true
      redirect_to("/collaborations/#{@collaboration.id}", :notice => "Collaboration updated successfully.")
    else
      render("collaborations/edit.html.erb")
    end
  end

  def destroy
    @collaboration = Collaboration.find(params[:id])

    @collaboration.destroy

    if URI(request.referer).path == "/collaborations/#{@collaboration.id}"
      redirect_to("/", :notice => "Collaboration removed.")
    else
      redirect_back(:fallback_location => "/", :notice => "Collaboration removed.")
    end
  end
  
  def shared_lists
    @collaboration = Collaboration.where(:user_id => current_user.id)
    
    render("collaborations/shared_lists.html.erb")
  end
end
