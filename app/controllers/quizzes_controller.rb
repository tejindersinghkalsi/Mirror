class QuizzesController < ApplicationController
  
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all
    layout :determine_layout
  # GET /quizzes
  def index
    @quizzes = Quiz.all
  end


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




  # GET /quizzes/new
  def new
    @quiz = Quiz.new
  end

  # GET /quizzes/1/edit
  def edit
  end

  # POST /quizzes
  def create
    @quiz = Quiz.new(quiz_params)

    if @quiz.save
      redirect_to @quiz, notice: 'Assignment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /quizzes/1
  def update
    if @quiz.update(quiz_params)
      redirect_to @quiz, notice: 'Assignment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /quizzes/1
  def destroy
    @quiz.destroy
    redirect_to quizzes_url, notice: 'Quiz was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def quiz_params
      params.require(:quiz).permit(:name, :schedule, :result, :time, {:students => []}, questions_attributes: [:id, :ques, :optionone, :optiontwo, :optionthree, :optionfour, :Answer, :_destroy], keys_attributes: [:id, :answer, :_destroy])
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
