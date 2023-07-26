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
  	@products = Product.all
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


  # def destroy
  #   @product = Product.find(params[:id])
  #   @product.destroy
  #   redirect_to new_product_myproducts
  # end

  def myproduct
    @products = current_account.products
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :picture)
  end
end
