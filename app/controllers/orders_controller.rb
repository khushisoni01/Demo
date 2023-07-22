class OrdersController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @account = Account.find(params[:account_id])
    @order = Order.new
  end

  def create
    @product = Product.find(params[:product_id])
    @account = @product.account_id
    @order = Order.new(order_params.merge(product_id: @product.id, account_id: @account))
    if @order.save
      redirect_to product_order_path(@product.id, @order.id)
    else
      render :new
    end
  end

  def index
  	@orders = Order.all
  end

  def show
  	@order = Order.find(params[:id])
  end

  def edit
  end

  def update
  end

  private
  def order_params
    params.require(:order).permit(:product_name, :address, :price,:account_id, :product_id)
  end
end
