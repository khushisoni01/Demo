class MyBackgroundJob
  include Sidekiq::Worker

  def perform
    byebug
    default_email = 'khushi@gmail.com' 
    # default_email = current_account.email

    Rails.logger.info "MyBackgroundJob started at #{Time.now}"
    OrderConfirmationMailer.buyer(default_email).deliver_now
    Rails.logger.info "MyBackgroundJob completed at #{Time.now}"
  end
end
