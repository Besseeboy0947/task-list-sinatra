require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "welcome back"
    set :public_folder, 'public'
    set :views, 'app/views'
    register Sinatra::Flash
  end
# if logged_in?
#redirect "/users/#{session[:user_id]}"
 helpers do 

    def logged_in? 
      !!session[:user_id]
    end 

    def current_user
      @current_user ||= User.find(session[:user_id])
    end 

  end 

  get "/" do
    if logged_in?
      redirect "/users/#{session[:user_id]}"
    else 
      erb :welcome
    end
  end


  
 get "/signup" do
    erb :welcome
 end

 get "/login" do
   erb :login
 end
  
delete "/tasks/:id" do
  @task= Task.find_by(id: params[:id])
    @task.delete
    redirect "/tasks"
  end
#patch

 post "/login" do
  @user =  User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id   
    redirect "/tasks"
  else 
   flash[:message] = "The username or password you entered is incorrect.?"
    redirect "/login"
  end 
end

 get "/logout" do #have yet to see a logout indication
  session.clear
  redirect "/" 
 end 

end
#post '/registrations' do
    #@user = User.new(name: params["name"], email: params["email"], password: params["password"])
    #@user.save
    #session[:user_id] = @user.id

    #redirect '/users/home'
  #end

  #get "/login" do
  #if logged_in?
    #@user.save
    #redirect "users"
  #erb :"/users/show.html"
 #end