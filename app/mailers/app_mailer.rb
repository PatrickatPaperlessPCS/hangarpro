class AppMailer < ApplicationMailer

	def hangar_inquiry(hangar, message)
	@message = message
	mail(
      :subject => 'Hangar listed on HangarRent.com',
      :to      => 'campbell5490@bellsouth.net',
      :track_opens => 'true'
    )
	end

end
