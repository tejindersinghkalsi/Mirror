class HomeController < ApplicationController

  before_action :authenticate_user!
  access all: [:home]

  layout "myhome"
    
  def home
  	 @word = Word.last
  	 @user_targets = Target.all

  	 @b = @user_targets.count 
      @c = []

      @w = []

      @s = []


  	 @user_targets.each do |target|

  	 	
     
         target.tasks.each do |task|
         
            q = Date.today
            z = Time.now
            mm = task.updated_at
            r = task.dateofcompletion
           

            if (@flag = ((r-q).to_i >= 1)) 

               if (task.owner == current_user.id)
                  @s << task.target_id
                  @c = Kaminari.paginate_array(@s).page(params[:page]).per(2)
                  @w << task.name
               end
            end

         end
     end
     @i = 0
  
  end

end
