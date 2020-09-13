class ConversationsController < ApplicationController
    
    layout "conversation"

	def index 
     @conversations = current_user.mailbox.conversations.paginate(page: params[:page], per_page: 5)
    end


	def show
     @conversation = current_user.mailbox.conversations.find(params[:id])
    end

    def new
     @recipients = User.all - [current_user]
    end

    def create
    	@recipient = User.find(params[:user_id])
    	receipt = current_user.send_message(@recipient, params[:body], params[:subject])
    end

end
