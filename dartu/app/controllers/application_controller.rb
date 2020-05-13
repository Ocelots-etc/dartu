require './config/environment'
require './app/models/user'
require './app/models/dart_set'
require './app/models/dart_case'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "dartsaretheworldtome"
    set :views, Proc.new { File.join(root, "../views/") }
  end

  get "/" do
    erb :index
  end

  # NEED TO BE ABLE TO LOGOUT.... and have a link for that on all? pages

  helpers do
    def redirect_if_not_logged_in
      if !logged_in?
        session[:error] = "You have to be logged in to do that"
        redirect "/login"
      end
    end

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find_by(:id => session[:user_id])
    end

  end  
end
