class FeedbacksController < ApplicationController

    #Layout 
    layout :determine_layout
    #Before-filters
    before_action :set_feedback, only: [:show, :edit, :update, :destroy]
    #Petergate authentication-accesses
    access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

    #Index action.
    def index
      @feedbacks = Feedback.all
    end

    #Show action.
    def show
    end

    #New action.
    def new
      @feedback = Feedback.new
      @users = User.all
      @feedbacks = Feedback.all
      @averageui = Feedback.average(:uipoints)
      @averageusability = Feedback.average(:usability)
      @averageimprovement = Feedback.average(:improvement)
      @c = Feedback.where(user_id: current_user.id)
    end

    #Edit action.
    def edit
    end

    #Create action. Works together with "New".
    def create
      @feedback = Feedback.new(feedback_params.merge(user_id: current_user.id))

      if @feedback.save
        redirect_to home_path, notice: 'Feedback was successfully created.'
      else
        render :new
      end
    end

    #Update action.Works togrther with "Edit".
    def update
    
      if @feedback.update(feedback_params)
        redirect_to @feedback, notice: 'Feedback was successfully updated.'
      else
        render :edit
      end
    end

    #Destroy action. Works together with "Delete".
    def destroy
      @feedback.destroy
      redirect_to feedbacks_url, notice: 'Feedback was successfully destroyed.'
    end

    #Private

    private
    
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

  
    def feedback_params
      params.require(:feedback).permit(:date, :uipoints, :usability, :improvement, :comments, :addfeatures)
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

end #End of Class.
