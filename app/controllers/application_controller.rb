require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "welcome back"
    set :public_folder, 'public'
    set :views, 'app/views'
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


 get "/" do
    erb :welcome
  end
  
 get "/signup" do
    erb :welcome
 end

 get "/login" do
   erb :login
 end
  
 
 post "/login" do
  @user =  User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id   
    redirect "/tasks"
  else 
    redirect "/login"
  end 
end


post '/login' do
  @sessions = session
   item = params["item"]
  @sessions[:item] = item
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