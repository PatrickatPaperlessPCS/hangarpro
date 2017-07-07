class MessagesController < ApplicationController

	def create
		@hangar = Hangar.find(params[:hangar_id])
		@message = Message.new(params[:message])
			if @message.valid? 
				AppMailer.hangar_inquiry(@hangar, @message).deliver_now
				redirect_to hangar_path(@hangar), notice: "Message Sent"
			else
				redirect_to hangar_path(@hangar), notice: "Message Invalid"
			end
	end
	
	private

	def message_params
		require(:message).permit(:subject, :body)
	end
end
