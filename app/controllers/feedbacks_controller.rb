class FeedbacksController < ApplicationController

  layout "feedback"

  before_action :set_feedback, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /feedbacks
  def index
    @feedbacks = Feedback.all
    
  end

  # GET /feedbacks/1
  def show
  end

  # GET /feedbacks/new
  def new
    @feedback = Feedback.new
    @users = User.all
    @feedbacks = Feedback.all
    @averageui = Feedback.average(:uipoints)
    @averageusability = Feedback.average(:usability)
    @averageimprovement = Feedback.average(:improvement)
    @c = Feedback.where(user_id: current_user.id)
  end

  # GET /feedbacks/1/edit
  def edit
  end

  # POST /feedbacks
  def create
    @feedback = Feedback.new(feedback_params.merge(user_id: current_user.id))

    if @feedback.save
      redirect_to home_path, notice: 'Feedback was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /feedbacks/1
  def update
    if @feedback.update(feedback_params)
      redirect_to @feedback, notice: 'Feedback was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /feedbacks/1
  def destroy
    @feedback.destroy
    redirect_to feedbacks_url, notice: 'Feedback was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def feedback_params
      params.require(:feedback).permit(:date, :uipoints, :usability, :improvement, :comments, :addfeatures)
    end
end
