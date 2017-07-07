class AppMailer < ApplicationMailer

	def hangar_inquiry(hangar, message, user)
	@message = message
	@hangar = hangar
	mail(
      :subject => 'Hangar listed on HangarRent.com',
      :to => 'campbell5490@bellsouth.net',
      :reply_to      => @message.subject,
      :track_opens => 'true'
    )
	end

end
