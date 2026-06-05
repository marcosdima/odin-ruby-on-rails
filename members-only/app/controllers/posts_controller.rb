class PostsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new, status: unprocessable_entity
    end
  end

  private
    def post_params
      params.expect(post: [ :title, :content ])
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
