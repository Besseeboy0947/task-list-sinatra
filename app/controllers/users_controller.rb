class UsersController < ApplicationController


  # get "/users" do  
  #   erb :"/users/show.html"
  # end
  #get '/users/signup' do 
      #if logged_in? 
         #redirect "/users/#{current_user.id}"
      #else
         #erb :'/users/new'        
      #end 
    #end 
 
  get "/users" do  
    @user = User.find_by(id: session[:user_id])
    erb :"/Users/index.html"
    erb :"/tasks/show.html"
  end
    

  # GET: /users/new
   get "/users/new" do  #making a Get request to /user/new. This is a route for the Signup Page
    erb :"/users/new.html" #RENDING A FORM TO SAVE AN INSTANCE OF NEW USER 
  end

  # POST: /users
  post "/signup" do #THis is where the params from the form end up.
 user = User.create(params) #create a new user using the data the user put in (params)
  redirect "/users/#{user.id}" #redirecting user to there show page using user id 
  end

  # GET: /users/5
  get "/users/:id" do  #Show page Route
   @user = User.find_by(id: params["id"]) 
  # erb :"/tasks/index.html"
  erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
     