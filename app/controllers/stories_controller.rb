class StoriesController < ApplicationController
    layout :determine_layout
  before_action :authenticate_user!
  before_action :set_story, only: [:show, :edit, :update, :destroy]

  before_action :user_signed_in?
  # GET /stories
  # GET /stories.json
  def index
    @stories = (Story.where(access: "PUBLIC")).recent.page(params[:page])
    @PVT = (Story.where(user_id: current_user.id))
    @private_stories = (@PVT.where(access: "PRIVATE")).recent.page(params[:page])
    @tweets = SocialTool.twitter_search
    @topics = Topic.all
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
    @story = Story.includes(:comments).find(params[:id])
    @comment = Comment.new
    impressionist(@story)
  end

  # GET /stories/new
  def new
    @story = Story.new
    @topics = Topic.all
  end

  # GET /stories/1/edit
  def edit
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = Story.new(story_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, notice: 'Story was successfully created.' }
        format.json { render :show, status: :created, location: @story }
      else
        format.html { render :new }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stories/1
  # PATCH/PUT /stories/1.json
  def update
    respond_to do |format|
      if @story.update(story_params)
        format.html { redirect_to @story, notice: 'Story was successfully updated.' }
        format.json { render :show, status: :ok, location: @story }
      else
        format.html { render :edit }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @story.destroy
    respond_to do |format|
      format.html { redirect_to stories_url, notice: 'Story was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = Story.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def story_params
      params.require(:story).permit( :title, :access, :body, :topic_id, :user_id, :Attachment )
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
