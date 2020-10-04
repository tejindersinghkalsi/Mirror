class ResearchesController < ApplicationController

  layout 'research'
  before_action :set_research, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /researches
  def index
    @researches = Research.recent.page(params[:page])
  end

  # GET /researches/1
  def show
  end

  # GET /researches/new
  def new
    @research = Research.new
  end

  # GET /researches/1/edit
  def edit
  end

  # POST /researches
  def create
    @research = Research.new(research_params)

    if @research.save
      redirect_to researches_path, notice: 'Research was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /researches/1
  def update
    if @research.update(research_params)
      redirect_to researches_path, notice: 'Research was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /researches/1
  def destroy
    @research.destroy
    redirect_to researches_url, notice: 'Research was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_research
      @research = Research.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def research_params
      params.require(:research).permit(:mainheading, :subheading, :contributed, :body)
    end
end
