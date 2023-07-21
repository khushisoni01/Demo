class RegistrationsController < Devise::RegistrationsController

    def show
        @account = Account.find(params[:id])
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
end

