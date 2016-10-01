class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end
  
  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_param)
    if @post.save
      # chuyển tới trang show post
      redirect_to post_path(@post)
    else
      # quay lại trang tạo post mới, đồng thời show error
      redirect_to new_post_path, flash: { error: @post.errors.full_messages }
    end
  end

  private
  def post_param
    params.require(:post).permit(:content, :title)
  end
  
end