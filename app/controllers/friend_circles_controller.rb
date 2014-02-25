class FriendCirclesController < ApplicationController

  def index
  end

  def show
    @friends = FriendCircle.find_by_owner_id(params[:user_id]).friends
  end

  def update
  end

  def edit
  end

end
