class DocipediasController < ApplicationController


  layout "docipedia"

  before_action :authenticate_user!
    
  def index
  	 @targets = (Target.where(user_id: current_user.id) and Target.where.not(doc: nil)).page(params[:page])

  end

end
