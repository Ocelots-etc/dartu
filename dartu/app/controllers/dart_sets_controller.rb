class DartSetsController < ApplicationController
  before "/dart_sets/*" do
    redirect_if_not_logged_in
  end

    @dart_case = current_user.dart_cases.find(params[:dart_case_id])
    @dart_set = @dart_case.dart_sets.new
    erb :'dart_sets/new'
  end

  post "/dart_cases/:dart_case_id/dart_sets" do # Rest equivalent: Create
    @dart_case = current_user.dart_cases.find(params[:dart_case_id])
    @dart_set = @dart_case.dart_sets.new(params)
    if @dart_set.save
      redirect "/dart_cases/#{ @dart_case.id }"
    else
      erb :'dart_sets/new'
    end
  end

  get "/dart_sets/:id" do # Rest equivalent: Show
    @dart_set = current_user.dart_sets.find(params[:id])
    # I want a link to my cases that this dart set is in at the bottom of this page
    # @dart_case = current_user.cases.find(params[:case_id])
    erb :'dart_sets/show'
  end

  get "/dart_sets/:id/edit" do # Rest-ish equivalent: Edit
    @dart_set = current_user.dart_sets.find(params[:id])
    
    erb :'dart_sets/edit'
  end

  put "/dart_sets/:id" do # Rest equivalent: Update
    @dart_set = current_user.dart_sets.find(params[:id])
    if @dart_set.update(params.except(:id, :_method))
      redirect "/dart_sets/#{ @dart_set.id }"
    else
      erb :'dart_sets/edit'
    end
  end

  delete "/dart_sets/:id" do # Rest equivalent: Delete
    @dart_set = current_user.dart_sets.find(params[:id])
    @dart_set.destroy
    redirect "/dart_cases/#{ @dart_set.dart_case_id }"
  end
end