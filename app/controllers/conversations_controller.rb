class ConversationsController < ApplicationController
    
     layout :determine_layout
    before_action :authenticate_user!
	def index 
     @conversations = current_user.mailbox.conversations.page(params[:page])
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
def determine_layout

    case current_user.colour

    when "orange"
    "myhomefour"

    when "black"
    "myhomethree"

    when "green"
    "myhometwo"

    else
    "myhome"
  end
end
end
