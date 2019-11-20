require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "welcome back"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
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

 
 get "/logout" do
  session.clear
  redirect "/" 
 end 

end
