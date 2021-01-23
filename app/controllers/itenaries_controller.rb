class ItenariesController < ApplicationController
  before_action :set_itenary, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

 layout "itenary"
  # GET /itenaries
  def index
    @itenaries = Itenary.where(st: "ACTIVE")

    @ar_itenaries = Itenary.where(st: "ARCHIVED")
  end

  # GET /itenaries/1
  def show
    @estimates = Estimate.where(user_id: current_user.id).page(params[:page])

    respond_to do |format|
      format.html
           format.pdf do 
             pdf = ItenaryPdf.new(@itenary)
             send_data pdf.render, filename: "itenary_download.pdf",
                                   type: "application/pdf",
                                   disposition: "inline"
                          
           end
      end
 end

  # GET /itenaries/new
  def new
    @itenary = Itenary.new
    @estimates = Estimate.where(user_id: current_user.id).page(params[:page])
  end

  def othernew
    @itenary = Itenary.new
  end

  # GET /itenaries/1/edit
  def edit
  end

  # POST /itenaries
  def create
    @itenary = Itenary.new(itenary_params)

    if @itenary.save
      redirect_to @itenary, notice: 'Itenary was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /itenaries/1
  def update
    if @itenary.update(itenary_params)
      redirect_to @itenary, notice: 'Itenary was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /itenaries/1
  def destroy
    @itenary.destroy
    redirect_to itenaries_url, notice: 'Itenary was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itenary
      @itenary = Itenary.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def itenary_params
      params.require(:itenary).permit(:start, :planname, :calender, :st, :related, subitenaries_attributes: [:id, :begin, :modeoftravel, :activity, :distance, :stay, :_destroy])
    end
end
