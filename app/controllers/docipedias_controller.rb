class DocipediasController < ApplicationController


   layout :determine_layout

  before_action :authenticate_user!
    
  def index
  	 @targets = (Target.where(user_id: current_user.id) and Target.where.not(doc: nil)).page(params[:page])

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
