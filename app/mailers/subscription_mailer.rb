class SubscriptionMailer < ApplicationMailer
	
	def subscription_email(user)
		@user = user
		mail(to: @user.email, subject: "Mirror - Weekly Journal")
    end
end
