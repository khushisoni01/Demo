class MessagesController < ApplicationController
	def create
    	@current_account = current_account
    	@message = @current_account.messages.create(content: msg_params[:content], room_id: params[:room_id])
  	end

  	private

  	def msg_params
    	params.require(:message).permit(:content)
  	end
end
