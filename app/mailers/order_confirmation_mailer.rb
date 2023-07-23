class OrderConfirmationMailer < ApplicationMailer
	default from: 'khushi@gmail.com'

	def buyer_confirmation(order)
		@order = order
		@buyer_email = Account.find_by(id: order.account_id)&.email
		mail(to: @buyer_email, subject: 'Order Confirmation')
	end

	def seller_confirmation(order)
		@order = order
    	@seller_email = order.product.account.email 
    	mail(to: @seller_email, subject: 'Order Confirmation')
	end
end
