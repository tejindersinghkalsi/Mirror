class CommunitiesController < ApplicationController
    
    #Layout
    layout :determine_layout


    #before-filters
    before_action :authenticate_user!
    before_action :set_community, only: [:show, :edit, :update, :destroy]
    #Petergate authentication-accesses
    access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

    #Index action.
    def index
      @communities = (Community.where.not(doc: nil)).page(params[:page])
    end

    #Show action.
    def show
    end
   
    #New action.
    def new
      @community = Community.new
    end

    #Edit action.
    def edit
    end

    #Create action. Works together with "New".
    def create
      @community = Community.new(community_params)

      if @community.save
        redirect_to @community, notice: 'Community was successfully created.'
      else
        render :new
      end
    end

    #Update action. Works together with "Edit".
    def update
      if @community.update(community_params)
        redirect_to @community, notice: 'Community was successfully updated.'
      else
        render :edit
      end
    end

    #Destroy action. Works together with "Delete".
    def destroy
      @community.destroy
      redirect_to communities_url, notice: 'Community was successfully destroyed.'
    end

    #Private

    private
 
    def set_community
      @community = Community.find(params[:id])
    end


    def community_params
      params.require(:community).permit(:title, :body, :doc)
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
