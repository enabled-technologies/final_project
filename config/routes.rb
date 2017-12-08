Rails.application.routes.draw do
  root 'lists#my_lists'
  
  # Routes for the Collaboration resource:
  # CREATE
  get "/collaborations/new", :controller => "collaborations", :action => "new"
  post "/create_collaboration", :controller => "collaborations", :action => "create"

  # READ
  get "/collaborations", :controller => "collaborations", :action => "index"
  get "/collaborations/:id", :controller => "collaborations", :action => "show"

  # UPDATE
  get "/collaborations/:id/edit", :controller => "collaborations", :action => "edit"
  post "/update_collaboration/:id", :controller => "collaborations", :action => "update"

  # DELETE
  get "/delete_collaboration/:id", :controller => "collaborations", :action => "destroy"
  #------------------------------

  # Routes for the Subtask resource:
  # CREATE
  get "/subtasks/new", :controller => "subtasks", :action => "new"
  post "/create_subtask", :controller => "subtasks", :action => "create"

  # READ
  get "/subtasks", :controller => "subtasks", :action => "index"
  get "/subtasks/:id", :controller => "subtasks", :action => "show"

  # UPDATE
  get "/subtasks/:id/edit", :controller => "subtasks", :action => "edit"
  post "/update_subtask/:id", :controller => "subtasks", :action => "update"

  # DELETE
  get "/delete_subtask/:id", :controller => "subtasks", :action => "destroy"
  #------------------------------

  # Routes for the Task resource:
  # CREATE
  get "/tasks/new", :controller => "tasks", :action => "new"
  post "/create_task", :controller => "tasks", :action => "create"

  # READ
  get "/tasks", :controller => "tasks", :action => "index"
  get "/tasks/:id", :controller => "tasks", :action => "show"

  # UPDATE
  get "/tasks/:id/edit", :controller => "tasks", :action => "edit"
  post "/update_task/:id", :controller => "tasks", :action => "update"
  get "/tasks/:id/edit_from_lists", :controller => "tasks", :action => "edit_from_lists"
  post "/update_task_from_lists/:id", :controller => "tasks", :action => "update_task_from_lists"

  # DELETE
  get "/delete_task/:id", :controller => "tasks", :action => "destroy"
  #------------------------------

  # Routes for the List resource:
  # CREATE
  get "/lists/new", :controller => "lists", :action => "new"
  post "/create_list", :controller => "lists", :action => "create"

  # READ
  get "/lists", :controller => "lists", :action => "index"
  get "/lists/:id", :controller => "lists", :action => "show"

  # UPDATE
  get "/lists/:id/edit", :controller => "lists", :action => "edit"
  post "/update_list/:id", :controller => "lists", :action => "update"
  get "/lists/:id/edit_from_my_lists", :controller => "lists", :action => "edit_from_my_lists"
  post "/update_list_from_my_lists/:id", :controller => "lists", :action => "update_from_my_lists"

  # DELETE
  get "/delete_list/:id", :controller => "lists", :action => "destroy"
  #------------------------------
  
  get "/my_lists", :controller => "lists", :action => "my_lists"
  
  get "/shared_lists", :controller => "collaborations", :action => "shared_lists"

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
