class OrdersController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    # @account = Account.find(params[:account_id])
    @order = Order.new
  end

  def create
    @product = Product.find(params[:product_id])
    # @account = Account.find(params[:account_id])
    # @account = @product.account_id
    @order = Order.new(order_params.merge(product_id: @product.id, account_id: current_account.id))
    if @order.save
      OrderConfirmationMailer.buyer_confirmation(@order).deliver_now
      OrderConfirmationMailer.seller_confirmation(@order).deliver_now
      redirect_to product_order_path(@product.id, @order.id)
    else
      render :new, status: :unprocessable_entity
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
    params.require(:order).permit(:address,:account_id, :product_id)
  end
end
