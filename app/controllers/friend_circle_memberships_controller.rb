class FriendCircleMembershipsController < ApplicationController

  def new
    @friend_membership = FriendCircleMembership.new
    @exclusion = current_user.friends.map(&:id)
    @exclusion << current_user.id
    @users = User.where("id not in (?)", @exclusion)
  end

  def create
    @circle = current_user.friend_circle

    params[:friend][:friend_ids].each do |friend_id|
      @circle.friendships.build(:friend_id => friend_id.to_i)
    end

    if @circle.save
      redirect_to user_url(current_user)
    else
      flash.now[:errors] = @circle.errors.full_messages
      @circle.friendships.each do |friendship|
        flash.now[:errors] << friendship.errors.full_messages
      end
      render :new
    end

  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

#  friend[friend_ids][]
end
