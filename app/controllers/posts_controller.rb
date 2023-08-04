class PostsController < ApplicationController
  def index
    @posts = Post.all.order(cached_votes_score: :desc)
    render partial: 'basic'
  end

  def new
    @post = Post.new
  end

  def all_order
    @orders = Order.all
  end


  def create
    @post = current_account.posts.build(post_params)
    
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end


  def show
    @post = Post.find(params[:id])
  end


  def edit
    @post = Post.find(params[:id])
  end

  def mypost
    @posts = current_account.posts
  end


  def update
    @post = Post.find(params[:id])
  
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end 
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: 'Post was successfully destroyed.'
  end


  def upvote
    @post = Post.find(params[:id])
      @post.liked_by current_account
        redirect_to posts_path
  end

  def downvote
    @post = Post.find(params[:id])
      @post.unliked_by current_account
        redirect_to posts_path
  end

  


  private
  def post_params
    params.require(:post).permit(:description, :image, pictures: [])
  end
end
