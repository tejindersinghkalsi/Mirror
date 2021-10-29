  class EstimatesController < ApplicationController
      
      #Layout 
      layout :determine_layout
      before_action :authenticate_user!

      #Before-filters
      before_action :set_estimate, only: [:show, :edit, :update, :destroy]
      #Petergate authentication-accesses
      access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

      #Index action.
      def index
        @estimates = Estimate.all
      end

      #Show action.
      def show
      end

      #New action.
      def new
        @estimate = Estimate.new
        @e = (Estimate.where(user_id: current_user.id)).page(params[:page]).per(3)
      end

      #Edit action.
      def edit
        @e = (Estimate.where(user_id: current_user.id)).page(params[:page]).per(3)
      end

      #Create action. Works together with "New".
      def create
         @estimate = Estimate.new(estimate_params.merge(user_id: current_user.id))

        if @estimate.save
          redirect_to @estimate, notice: 'Estimate was successfully created.'
        else
          render :new
        end
      end

      #Update action.Works togrther with "Edit".
      def update
      
        if @estimate.update(estimate_params)
          redirect_to @estimate, notice: 'Estimate was successfully updated.'
        else
          render :edit
        end
      end

      #Destroy action. Works together with "Delete".
      def destroy
        @estimate.destroy
        redirect_to new_estimate_path, notice: 'Estimate was successfully destroyed.'
      end

      #Private


      private
      
      def set_estimate
        @estimate = Estimate.find(params[:id])
      end

      def estimate_params
        params.require(:estimate).permit(:name, :description, :year_id, :share, :Recommendation, tours_attributes: [:id, :name, :namec, :multiplier, :Link, :_destroy])
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
