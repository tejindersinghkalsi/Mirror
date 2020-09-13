class TopicsController < ApplicationController
  layout "story"


  def aroundme
  	@stories = Story.recent.where(topic_id: 1).page(params[:page])
    @tweets = SocialTool.twitter_search
  end

   def technology
  	@stories = Story.recent.where(topic_id: 2).page(params[:page])
    @tweets = SocialTool.twitter_search
  end

  def travel
    @stories = Story.recent.where(topic_id: 3).page(params[:page])
    @tweets = SocialTool.twitter_search
  end

  def food
    @stories = Story.recent.where(topic_id: 4).page(params[:page])
    @tweets = SocialTool.twitter_search
  end

  def career
    @stories = Story.recent.where(topic_id: 5).page(params[:page])
    @tweets = SocialTool.twitter_search
  end

  def examination
    @stories = Story.recent.where(topic_id: 6).page(params[:page])
    @tweets = SocialTool.twitter_search
  end



end
 