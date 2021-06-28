class QuestionsController < ApplicationController

    #Layout
    layout :determine_layout
    before_action :authenticate_user!
    #Before-filters
    before_action :set_question, only: [:show, :edit, :update, :destroy]
    #Petergate authentication-accesses
    access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

    #Index action.
    def index
      @questions = Question.all
    end
    #Show action.
    def show
    end
    #New action.
    def new
      @question = Question.new
    end
    #Edit action.
    def edit
    end

    #Create action. Works together with "New".
    def create
      @question = Question.new(question_params)

      if @question.save
        redirect_to @question, notice: 'Question was successfully created.'
      else
        render :new
      end
    end

    #Update action.Works togrther with "Edit".
    def update
      if @question.update(question_params)
        redirect_to @question, notice: 'Question was successfully updated.'
      else
        render :edit
     end
    end

    #Destroy action. Works together with "Delete".
    def destroy
      @question.destroy
      redirect_to questions_url, notice: 'Question was successfully destroyed.'
    end

    #Private

    private
    
    def set_question
      @question = Question.find(params[:id])
    end

    
    def question_params
      params.require(:question).permit(:ques, :optionone, :optiontwo, :optionthree, :optionfour, :Answer, solutions_attributes: [:id, :correctanswer, :_destroy])
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
