class DocipediasController < ApplicationController

    #Layout
    layout :determine_layout

    #Before-filters
    before_action :authenticate_user!
    
    #Index action.
    def index
  	   @targets = (Target.where(Target.where.not(doc: nil) and (user_id: current_user.id))).page(params[:page])
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
    end


end #End of Class.
