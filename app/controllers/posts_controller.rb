class PostsController < ApplicationController

  def index
  end

  def new
    @post = Post.new(author_id: params[:user_id].to_i)
    @circles = current_user.friend_circles
    3.times {@post.links.build}
  end

  def create


  end

  def edit
  end

  def update
  end

  def detroy
  end

  private
  def post_params
    params.permit(:link)
  end

  def link_params
    params.permit(:links => [:content]).require(:links).values
  end
end
