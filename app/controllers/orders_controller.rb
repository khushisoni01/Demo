class OrdersController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @order = Order.new
  end

  def create
    @product = Product.find(params[:product_id])
    @order = Order.new(order_params.merge(product_id: @product.id, account_id: current_account.id, price: @product.price))
    if @order.save
      # MyBackgroundJob.new.perform
      MyBackgroundJob.new.perform(current_account.id)
      redirect_to product_order_path(@product.id, @order.id)
    else
      render :new, status: :unprocessable_entity
    end
  end


  def index
    @orders = current_account.orders
  end

  def all_orders
    @orders = Order.all
  end

  def edit_orders
    @order = Order.find(params[:id])
    @order.update(confirm: true)
    OrderConfirmationMailer.buyer_confirmation(@order).deliver_now
    OrderConfirmationMailer.seller_confirmation(@order).deliver_now 
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
    params.require(:order).permit(:address,:account_id, :product_id, :price)
  end

  def time_until_midnight
    current_time = Time.current
    midnight_tomorrow = current_time.tomorrow.beginning_of_day
    midnight_tomorrow - current_time
  end
end
