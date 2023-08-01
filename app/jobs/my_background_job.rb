class MyBackgroundJob
  include Sidekiq::Worker

  def perform(account_id)
    default_email = Account.find_by(id: account_id)&.email
    Rails.logger.info "MyBackgroundJob started at #{Time.now}"
    OrderConfirmationMailer.sidekiq(default_email).deliver_now
  end
end


