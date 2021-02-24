class HomeController < ApplicationController


  before_action :authenticate_user!
  access all: [:home, :accountsettings, :systemaccess, :custom, :expensereport, :targetreport, :bookmark, :yearreport]
  layout :determine_layout

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

  def expensereport
    
    
  end

  def targetreport
    
    
  end

  def bookmark
    user = current_user.id
    @u = User.find(user)
    
  end

  def yearreport
    
    
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
