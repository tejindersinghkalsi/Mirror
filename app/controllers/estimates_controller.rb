class EstimatesController < ApplicationController

    layout :determine_layout

  before_action :set_estimate, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /estimates
  def index
    @estimates = Estimate.all
  end

  # GET /estimates/1
  def show
  
  end

  # GET /estimates/new
  def new
    @estimate = Estimate.new
    @e = (Estimate.where(user_id: current_user.id)).page(params[:page]).per(3)
  end

  # GET /estimates/1/edit.
   def edit
     @e = (Estimate.where(user_id: current_user.id)).page(params[:page]).per(3)
  end

  # POST /estimates
  def create
    @estimate = Estimate.new(estimate_params.merge(user_id: current_user.id))

    if @estimate.save
      redirect_to @estimate, notice: 'Estimate was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /estimates/1
  def update
    if @estimate.update(estimate_params)
      redirect_to @estimate, notice: 'Estimate was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /estimates/1
  def destroy
    @estimate.destroy
    redirect_to new_estimate_path, notice: 'Estimate was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estimate
      @estimate = Estimate.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def estimate_params
      params.require(:estimate).permit(:name, :description, :year_id, :share, :Recommendation, tours_attributes: [:id, :name, :namec, :multiplier, :Link, :_destroy])
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
