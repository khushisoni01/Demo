class RegistrationsController < Devise::RegistrationsController

    def show
        byebug
        @account = Account.find(params[:id])
        @current_account = current_account
        @rooms = Room.public_rooms
        @accounts = Account.all_except(@current_account)
        @room = Room.new
        @message = Message.new
        @room_name = get_name(@account, @current_account)
        @single_room = Room.where(name: @room_name).first || Room.create_private_room([@account, @current_account], @room_name)
        @messages = @single_room.messages

        render "rooms/index"

    end

    def follow
        # byebug
        @account = Account.find(params[:id])
        current_account.send_follow_request_to(@account)
        @account.accept_follow_request_of(current_account)
        redirect_to post_path
    end

    
    def unfollow
        @account = Account.find(params[:id])
        current_account.unfollow(@account)
        redirect_to post_path
    end

    def accept
        @account = Account.find(params[:id])
        current_account.accept_follow_request_of(@account)
        # redirect_to root_path
    end

    def cancel
        @account = Account.find(params[:id])
        current_account.remove_follow_request_for(@account)
        # redirect_to root_path
    end

    private

    def sign_up_params
        params.require(:account).permit(:name, :email, :password, :password_confirmation, :role)
    end

    def account_update_params
        params.require(:account).permit(:name, :email, :password, :password_confirmation, :current_password, :role)
    end


    def get_name(user1, user2)
        users = [user1, user2].sort
        "private_#{users[0].id}_#{users[1].id}"
    end
end

