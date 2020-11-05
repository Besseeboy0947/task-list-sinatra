class TasksController < ApplicationController

  # GET: /tasks
  get "/tasks" do
    @user = User.find_by(id: session[:user_id])
    erb :"/tasks/index.html"
  end

  # GET: /tasks/new
  get "/tasks/new" do
    erb :"/tasks/new.html"
  end

# post "/tasks/:id" do  
#     @task = Task.find_by_id(params[:id])
#     redirect to "/tasks"
#   end
# delete "/tasks/:id" do
#     binding.pry
#     # @task.delete
#     # redirect "/tasks"
#   end
  # POST: /tasks
  post "/tasks" do
    @task = Task.new(name: params[:task], description: params[:description], user_id: current_user.id )
    @task.save
    redirect "/tasks"
  end
  
  # GET: /tasks/5
  get "/tasks/:id" do
  @user = current_user
    erb :"/tasks/show.html"
  end

  # GET: /tasks/5/edit
  get "/tasks/:id/edit" do
    @task= Task.find_by(id: params[:id])
    erb :"/tasks/edit.html"
  end

  
  patch "/tasks/:id" do  
  @task = Task.find_by(id: params[:id])
  @task.update(description: params[:description], name: params[:task])
  redirect "/tasks/#{@task.id}"
end
 
 
  delete "/tasks/:id" do
  @task= Task.find_by(id: params[:id])
    @task.delete
    redirect "/tasks"
  end
  
  # DELETE: /tasks/5/delete

end
#patch to update your edit form task/edit 

