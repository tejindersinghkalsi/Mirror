class CommunitiesController < ApplicationController
    layout :determine_layout
  before_action :authenticate_user!
  before_action :set_community, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /communities
  def index
    @communities = (Community.where.not(doc: nil)).page(params[:page])

  end

  # GET /communities/1
  def show
  end

  # GET /communities/new
  def new
    @community = Community.new
  end

  # GET /communities/1/edit
  def edit
  end

  # POST /communities
  def create
    @community = Community.new(community_params)

    if @community.save
      redirect_to @community, notice: 'Community was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /communities/1
  def update
    if @community.update(community_params)
      redirect_to @community, notice: 'Community was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /communities/1
  def destroy
    @community.destroy
    redirect_to communities_url, notice: 'Community was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_community
      @community = Community.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def community_params
      params.require(:community).permit(:title, :body, :doc)
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
