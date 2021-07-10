class HomeController < ApplicationController
    
    require 'json'
    require 'httparty'
    #Layout
    layout :determine_layout
    #Before-filters
    before_action :authenticate_user!
    #Petergate authentication-accesses
    access all: [:home, :accountsettings, :trips, :systemaccess, :custom, :expensereport, :targetreport, :bookmark, :news, :yearreport, :bucket_list, :set_bucket_list, :destinations]
  
    def news
      @word = Word.all.order("created_at DESC")
      @latest = Word.last
    end

    def bucket_list
      @bucket_list = Visit.where(user_id: current_user.id)
      user = current_user.id
      @u = User.find(user)  
    end

    def destinations
      @m =  Visit.find(params[:m]) 
      g = ENV.fetch('API_Key')

      @q = @m.country.upcase
      @response = HTTParty.get("https://maps.googleapis.com/maps/api/place/textsearch/json?input=#{@q}+tourist+destinations&language=en&key=#{g}")
      @http_party_json = JSON.parse(@response.body)

      @response_two = HTTParty.get("https://maps.googleapis.com/maps/api/place/textsearch/json?input=#{@q}+top+hotels+and+resorts&language=en&key=#{g}")
      @http_party_json_two = JSON.parse(@response_two.body)

      @response_three = HTTParty.get("https://maps.googleapis.com/maps/api/place/textsearch/json?input=#{@q}+restaurants&language=en&key=#{g}")
      @http_party_json_three = JSON.parse(@response_three.body)

      @response_four = HTTParty.get("https://maps.googleapis.com/maps/api/place/textsearch/json?input=#{@q}+airport&type=airport&language=en&key=#{g}")
      @http_party_json_four = JSON.parse(@response_four.body)
    end 

    def bookmark
      user = current_user.id
      @u = User.find(user)
    end

    def trips 
    @bucket_list = Visit.where(user_id: current_user.id)
      user = current_user.id
      @u = User.find(user)  
        @e = (Estimate.where(user_id: current_user.id)).page(params[:page]).per(10)
    end

    def set_bucket_list
      user = current_user.id
      @u = User.find(user)
    end 

    def accountsettings
      @user = current_user.id
    end

    def systemaccess
      user = current_user.id
      @u = User.find(user)
    end

    def custom
      user = current_user.id
      @u = User.find(user)
    end

    def bookmark
      user = current_user.id
      @u = User.find(user)
    end

    def home

      @bookmarks = Bookmark.where(user_id: current_user.id)
      @festival = Festival.first
      @itenaries = Itenary.all
      @estimates = Estimate.where(user_id: current_user.id).page(params[:page])
      @quizzes = Quiz.all

      @years = Year.all
  	  @word = Word.last
  	  @user_targets = Target.all

      @c = []
      @w = []
      @s = []
      @ff = []


  	  @user_targets.each do |target|

  	 	     target.tasks.each do |task|
         
                q = Date.today
                z = Time.now
                mm = task.updated_at
                r = task.dateofcompletion
           

                if (@flag = ((r-q).to_i >= 1)) 

                        if (task.owner == current_user.id)
                  
                                @s << task.target_id
                                @w << task.name
                                @ff = @s.zip(@w)
                                @c = Kaminari.paginate_array(@ff).page(params[:page]).per(2)
                  
                        end
                
                end

            end

       end 
     
  
    end #End of Home method.



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
  
end  #End of Class.