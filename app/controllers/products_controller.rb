class ProductsController < ApplicationController
  def new
  	@product = Product.new
  end

  def create
    @product = current_account.products.build(product_params)
    if @product.save
      redirect_to @product, notice: "Product created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    if params[:search].present?
      @products = Product.where("description LIKE ?", "%#{params[:search]}%")
    else
      @products = Product.all
    end
    @products = @products.page(params[:page]).per(5)
  end


  def edit
  	@product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product, notice: "Product updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end
 
  def show
  	@product = Product.find(params[:id])
  end


  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to posts_path, notice: 'Product was successfully destroyed.'
  end


  def myproduct
    @products = current_account.products
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :picture)
  end
end
