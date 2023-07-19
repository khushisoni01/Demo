class PostsController < ApplicationController
  def index
    @posts= Post.all
    if current_account.role == "basic_account"
      render partial: 'basic'
    else
      render partial: 'business'
    end
  end

  def new
    @post = Post.new
  end

  # def create
  #   @post = current_account.posts.build(post_params)
  #    if @post.image.present?
  #     image_path(post.image)
  #   end

  #   if @post.save
  #     redirect_to @post, notice: 'Post was successfully created.'
  #   else
  #     render :new
  #   end
  # end


  def create
    @post = current_account.posts.build(post_params)
    
    # if @post.image.present?
    #   @post.image_path = image_path(@post.image)
    # end
    
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end


  def show
    @post = Post.find(params[:id])
    end


  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
  
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end 
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: 'Post was successfully destroyed.'
  end

  private

  def post_params
    params.require(:post).permit(:tag_people, :description, :image)
  end
end
