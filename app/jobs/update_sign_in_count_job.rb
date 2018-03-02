class UpdateSignInCountJob < ApplicationJob
  queue_as :default

  def perform(user)
    count = user.signed_count
    count+=1
    user.update_attributes(signed_count: count, last_sign_in: Time.now)
  end
end
