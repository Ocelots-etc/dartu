class UsersController < ApplicationController
  
  get '/users/new' do
    @user = User.new
    erb :'/users/new'
  end

  get '/users/:id' do
    if !logged_in?
      redirect '/login'
    end
    @user = User.find(params[:id])
    redirect '/dart_cases'
  end

  post '/signup' do 
    if params[:username] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.new(:username => params[:username], :password => params[:password])
      if @user.save
        session[:user_id] = @user.id
        redirect '/dart_cases'
      else
        erb :'users/new'
      end
    end
  end

  get '/login' do
    @error_message = session[:error]
    session.delete :error
    if !session[:user_id]
      erb :'users/login'
    else
      redirect '/dart_cases'
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/dart_cases'
    else
      @error_message = "Invalid Login. Please Try Again"

      erb :'users/login'
     
    end
  end

  get '/logout' do
    if session[:user_id] != nil
      session.destroy
      redirect '/login'
    else
      redirect '/'
    end
  end
end