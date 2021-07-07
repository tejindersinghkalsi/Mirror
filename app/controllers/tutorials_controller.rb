class TutorialsController < ApplicationController

    #Layout
    layout :determine_layout
    #Before-filters
    before_action :authenticate_user!
    #Before-filters
    before_action :set_tutorial, only: [:show, :edit, :update, :destroy]
    #Petergate authentication-accesses
    access site_admin: [:index, :show, :new, :edit, :create, :update, :destroy]
    
    #Index action.
    def index
      @tutorials = Tutorial.all
    end
    #Show action.
    def show
      impressionist(@tutorial)
    end
    #New action.
    def new
      @tutorial = Tutorial.new
    end
    #Edit action.
    def edit
    end
    #Create action. Works together with "New".
    def create
      @tutorial = Tutorial.new(tutorial_params)

      if @tutorial.save
        redirect_to @tutorial, notice: 'Tutorial was successfully created.'
      else
        render :new
      end
    end
    #Update action.Works togrther with "Edit".
    def update
      if @tutorial.update(tutorial_params)
        redirect_to @tutorial, notice: 'Tutorial was successfully updated.'
      else
        render :edit
      end
    end
    #Destroy action. Works together with "Delete".
    def destroy
      @tutorial.destroy
      redirect_to tutorials_url, notice: 'Tutorial was successfully destroyed.'
    end

    #Private

    private
    
    def set_tutorial
      @tutorial = Tutorial.find(params[:id])
    end

    
    def tutorial_params
      params.require(:tutorial).permit(:title, :description, :area, :doc, :command, :name, :function)
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
