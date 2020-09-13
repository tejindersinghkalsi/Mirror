class DocipediasController < ApplicationController


  layout "docipedia"
    
  def index
  	 @targets = (Target.where(user_id: current_user.id) and Target.where.not(doc: nil)).paginate(page: params[:page], per_page: 5)

  end

end
