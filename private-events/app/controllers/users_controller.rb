class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_events = @user.created_events
    @past_events = @user.attended_events.past
    @future_events = @user.attended_events.future
  end
end
