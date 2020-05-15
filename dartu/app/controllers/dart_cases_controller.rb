class DartCasesController < ApplicationController
  before "/dart_cases/*" do
    redirect_if_not_logged_in
  end

  get "/dart_cases" do # Rest equivalent: List / Index
    @dart_cases = current_user.dart_cases.all
    erb :'dart_cases/index'
  end

  get "/dart_cases/new" do # Rest-ish equivalent: New
    @dart_case = current_user.dart_cases.new
    erb :'dart_cases/new'
  end

  post "/dart_cases" do # Rest equivalent: Create
    @dart_case = current_user.dart_cases.new(params)
    if @dart_case.save
      redirect "/dart_cases"
    else
      erb :'dart_cases/new'
    end
  end

  get "/dart_cases/:id" do # Rest equivalent: Show
    @dart_case = current_user.dart_cases.find(params[:id])
    erb :'dart_cases/show'
  end

  get "/dart_cases/:id/edit" do # Rest-ish equivalent: Edit
    @dart_case = current_user.dart_cases.find(params[:id])
    erb :'dart_cases/edit'
  end

  put "/dart_cases/:id" do # Rest equivalent: Update
    @dart_case = current_user.dart_cases.find(params[:id])
    if @dart_case.update(params.except(:id, :_method))
      redirect "/dart_cases"
    else
      erb :'dart_cases/edit'
    end
  end

  delete "/dart_cases/:id" do # Rest equivalent: Delete
    @dart_case = current_user.dart_cases.find(params[:id])
    @dart_case.delete
    redirect "/dart_cases"
  endji
end