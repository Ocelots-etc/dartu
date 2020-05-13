class DartSetsController < ApplicationController
  before "/dart_sets/*" do
    redirect_if_not_logged_in
  end

  # Made it here but got this error when merely
  # typing in /dart_sets/new: Couldn't find DartSet with 'id'=new [WHERE "cases"."user_id" = ?]
  # the fact that I got this error may help with getting this error on other pages
  get "/dart_cases/:dart_case_id/dart_sets/new" do # Rest-ish equivalent: New
    @dart_case = current_user.dart_cases.find(params[:dart_case_id])
    @dart_set = @dart_case.dart_sets.new
    erb :'dart_sets/new'
  end

  # WORKS
  post "/dart_cases/:dart_case_id/dart_sets" do # Rest equivalent: Create
    @dart_case = current_user.dart_cases.find(params[:dart_case_id])
    @dart_set = @dart_case.dart_sets.new(params)
    if @dart_set.save
      redirect "/dart_cases/#{ @dart_case.id }"
    else
      erb :'dart_sets/new'
    end
  end

  # WORKS though I'd like an error message upon clicking New Dart 
  # before form is filled out and submitted when there are already three darts in set
  # I'd also like a link at the bottom back to the case these darts are in
  # and a link back to all cases
  get "/dart_sets/:id" do # Rest equivalent: Show
    @dart_set = current_user.dart_sets.find(params[:id])
    # I want a link to my cases that this dart set is in at the bottom of this page
    # @dart_case = current_user.cases.find(params[:case_id])
    erb :'dart_sets/show'
  end

  # WORKS
  get "/dart_sets/:id/edit" do # Rest-ish equivalent: Edit
    @dart_set = current_user.dart_sets.find(params[:id])
    
    erb :'dart_sets/edit'
  end

  # WORKS but I'd like to add a link for the case this set is in
  put "/dart_sets/:id" do # Rest equivalent: Update
    @dart_set = current_user.dart_sets.find(params[:id])
    if @dart_set.update(params.except(:id, :_method))
      redirect "/dart_sets/#{ @dart_set.id }"
    else
      erb :'dart_sets/edit'
    end
  end

  # not sure that I need /cases/:case_id at the beginning here... 
  # <ActiveRecord::RecordNotFound: Couldn't find Case without an ID>
  delete "/dart_sets/:id" do # Rest equivalent: Delete
    @dart_set = current_user.dart_sets.find(params[:id])
    @dart_set.destroy
    redirect "/dart_cases/#{ @dart_set.dart_case_id }"
  end
end