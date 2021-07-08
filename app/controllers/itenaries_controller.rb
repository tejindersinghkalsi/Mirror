class ItenariesController < ApplicationController
    
    require 'json'
    require 'httparty'
    #Layout
    layout :determine_layout
    before_action :authenticate_user!
    #Before-filters
    before_action :set_itenary, only: [:show, :edit, :update, :destroy]
    #Petergate authentication-accesses
    access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

   
    #Index action.
    def index
      @itenaries = Itenary.where(st: "ACTIVE")
      @ar_itenaries = Itenary.where(st: "ARCHIVED")
    end

    #Show action.
    def show
    
      @estimates = Estimate.where(user_id: current_user.id).page(params[:page])

      respond_to do |format|
        format.html
           format.pdf do 
             pdf = ItenaryPdf.new(@itenary)
             send_data pdf.render, filename: "itenary_download.pdf",
                                   type: "application/pdf",
                                   disposition: "inline"
                          
           end
      end

    end

    #New action.
    def new
      @itenary = Itenary.new
      @estimates = Estimate.where(user_id: current_user.id).page(params[:page])
    end

    def othernew
      @itenary = Itenary.new
    end

    #Edit action.
    def edit
    end

    #Create action. Works together with "New".
    def create
      
      @itenary = Itenary.new(itenary_params)

      if @itenary.save
        redirect_to @itenary, notice: 'Itenary was successfully created.'
      else
        render :new
      end
    end

    #Update action.Works togrther with "Edit".
    def update
     
      if @itenary.update(itenary_params)
        redirect_to @itenary, notice: 'Itenary was successfully updated.'
      else
        render :edit
      end

    end

    #Destroy action. Works together with "Delete".
    def destroy
      @itenary.destroy
      redirect_to itenaries_url, notice: 'Itenary was successfully destroyed.'
    end

    #Private

    private
    
    def set_itenary
      @itenary = Itenary.find(params[:id])
    end

    
    def itenary_params
      params.require(:itenary).permit(:start, :planname, :calender, :longitude, :latitude, :st, :related, subitenaries_attributes: [:id, :begin, :modeoftravel, :location, :activity, :distance, :stay, :_destroy])
    end

    #Layout method.
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
