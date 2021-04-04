class QuizzesController < ApplicationController

    #Layout
    layout :determine_layout
    #Before-filters
    before_action :set_quiz, only: [:show, :edit, :update, :destroy]
    #Petergate authentication-accesses
    access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all
    
    #Index action.
    def index
      @quizzes = Quiz.all
    end

    #Show action.
    def show
    respond_to do |format|
      format.html
           format.pdf do 
             pdf = QuizPdf.new(@quiz)
             send_data pdf.render, filename: "quiz_download.pdf",
                                   type: "application/pdf",
                                   disposition: "inline"
                          
           end
      end
    end

    #New action.
    def new
      @quiz = Quiz.new
    end
    #Edit action.
    def edit
    end
    #Create action. Works together with "New".
    def create
      @quiz = Quiz.new(quiz_params)

      if @quiz.save
        redirect_to @quiz, notice: 'Assignment was successfully created.'
      else
        render :new
      end
    end

    #Update action.Works togrther with "Edit".
    def update
      if @quiz.update(quiz_params)
        redirect_to @quiz, notice: 'Assignment was successfully updated.'
      else
        render :edit
      end
    end

    #Destroy action. Works together with "Delete".
    def destroy
      @quiz.destroy
      redirect_to quizzes_url, notice: 'Quiz was successfully destroyed.'
    end

    #Private

    private
    
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    
    def quiz_params
      params.require(:quiz).permit(:name, :schedule, :result, :time, {:students => []}, questions_attributes: [:id, :ques, :optionone, :optiontwo, :optionthree, :optionfour, :Answer, :_destroy], keys_attributes: [:id, :answer, :_destroy])
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
