class TopicsController < ApplicationController
  layout "story"


  def aroundme
  	@stories = Story.recent.where(topic_id: 1).paginate(page: params[:page], per_page: 5)
    @tweets = SocialTool.twitter_search
  end

   def technology
  	@stories = Story.recent.where(topic_id: 2).paginate(page: params[:page], per_page: 5)
    @tweets = SocialTool.twitter_search
  end

  def travel
    @stories = Story.recent.where(topic_id: 3).paginate(page: params[:page], per_page: 5)
    @tweets = SocialTool.twitter_search
  end

  def food
    @stories = Story.recent.where(topic_id: 4).paginate(page: params[:page], per_page: 5)
    @tweets = SocialTool.twitter_search
  end

  def career
    @stories = Story.recent.where(topic_id: 5).paginate(page: params[:page], per_page: 5)
    @tweets = SocialTool.twitter_search
  end

  def examination
    @stories = Story.recent.where(topic_id: 6).paginate(page: params[:page], per_page: 5)
    @tweets = SocialTool.twitter_search
  end



end
 