class HomeController < ApplicationController


  before_action :authenticate_user!
  access all: [:home]

  layout "myhome"
  
  def home

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

end
