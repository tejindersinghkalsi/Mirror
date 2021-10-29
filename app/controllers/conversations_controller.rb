    class ConversationsController < ApplicationController
        
        #Layout
        layout :determine_layout

        #Before-filters
        before_action :authenticate_user!
    	  
        #Index action.
        def index 
          @conversations = current_user.mailbox.conversations.page(params[:page])
        end

        #Show Action
    	  def show
          @conversation = current_user.mailbox.conversations.find(params[:id])
        end

        #New Action
        def new
         @recipients = User.all - [current_user]
        end
        
        #Create Action. Works together with "New".
        def create
        	@recipient = User.find(params[:user_id])
        	receipt = current_user.send_message(@recipient, params[:body], params[:subject])
        end

        #Layout method
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


    end #End of class.
