class PostsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def basic_account
    redirect_to basic_account_path
  end

  def business_account
    redirect_to business_account_path
  end
  
end
