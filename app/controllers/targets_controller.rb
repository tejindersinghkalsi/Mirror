class TargetsController < ApplicationController
  layout "target"
  before_action :authenticate_user!
  before_action :set_target, only: [:show, :edit, :update, :destroy]

  # GET /targets
  # GET /targets.json
  def index
    @personal_targets = (Target.where(user_id: current_user.id)).page(params[:page])

              @stale_personal_targets = (Target.where(user_id: current_user.id))

               @p = []
               @h = []


               @stale_personal_targets.each do |target|

      
     
                    target.tasks.each do |task|


                      
         
                       q = Date.today
                       m = task.updated_at.to_date
                       
           

                        if (@flag = ((q - m).to_i >= 3))
                          if (task.owner == current_user.id)
                             
                             @p << task.target_id
                             @h << task.name
                          end
                         end 
                    end
                    @j = 0 
              end
    
  end



  # GET /targets/1
  # GET /targets/1.json
  def show
    
     @target.tasks.each do |g|
     @count = 0
     @v = 0
     @w = 0
     @n = 0
     y = g.updated_at.to_date
     c = Date.today
     if(@r = ((c-y).to_i >=3))
     @count =+1
     end
     if g.progress.between?(0,24)
      @v =+ 1
     end
     if g.progress.between?(75,100)
      @n =+ 1
     end

     
   end
   @g = (@target.tasks.count)*100
   @j =  @target.tasks.sum(:progress)
     @x = @g - @j





  end
  # GET /targets/new
  def new
    @target = Target.new

  end

  def groupnew
    @target = Target.new
  end

 def groupindex
    @group_targets = (Target.where(":user_id = ANY(member)", user_id: current_user.id )).page(params[:page])
    

      @stale_group_targets = (Target.where(":user_id = ANY(member)", user_id: current_user.id ))

               @e = []
               @u = []


               @stale_group_targets.each do |target|

      
     
                    target.tasks.each do |task|


                      
         
                       q = Date.today
                       m = task.updated_at.to_date
                       
           

                        if (@flag = ((q - m).to_i >= 3))

                           if (task.owner == current_user.id)  
                             @e << task.target_id
                             @u << task.name
                            end
                         end 
                    end
                    @b = 0
              end
     
  end


  # GET /targets/1/edit
  def edit
  end

  # POST /targets
  # POST /targets.json
  def create
    @target = Target.new(target_params.merge(user_id: current_user.id))
    
    respond_to do |format|
      if @target.save
        format.html { redirect_to @target, notice: 'Target was successfully created.' }
        format.json { render :show, status: :created, location: @target }
      else
        format.html { render :new }
        format.json { render json: @target.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /targets/1
  # PATCH/PUT /targets/1.json
  def update
    respond_to do |format|
      if @target.update(target_params)
        format.html { redirect_to @target, notice: 'Target was successfully updated.' }
        format.json { render :show, status: :ok, location: @target }
      else
        format.html { render :edit }
        format.json { render json: @target.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /targets/1
  # DELETE /targets/1.json
  def destroy
    @target.destroy
    respond_to do |format|
      format.html { redirect_to targets_url, notice: 'Target was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_target
      @target = Target.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def target_params
      params.require(:target).permit(:name, :description, :begin, :end, :doc, {:member => []}, :lead, tasks_attributes: [:id, :name, :point, :owner, :progress, :dateofcompletion, :_destroy])
    end
end

