class YearsController < ApplicationController
    layout :determine_layout
  before_action :authenticate_user!
  before_action :set_year, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /years
  def index
    @years = Year.where(user_id: current_user.id).page(params[:page])
  end

  # GET /years/1


  def show

    a=@year.januaries.all
  @ml = a.sum(:cost)

  b=@year.februaries.all
  @n = b.sum(:cost)

  c=@year.marches.all
  @o = c.sum(:cost)

  d=@year.aprils.all
  @p = d.sum(:cost)

  e=@year.mays.all
  @q = e.sum(:cost)

  f=@year.junes.all
  @r = f.sum(:cost)

  g=@year.julies.all
  @s = g.sum(:cost)

  h=@year.augusts.all
  @t = h.sum(:cost)

  i=@year.septembers.all
  @uuu = i.sum(:cost)

  j=@year.octobers.all
  @vvv = j.sum(:cost)

  k=@year.novembers.all
  @w = k.sum(:cost)

  l=@year.decembers.all
  @x = l.sum(:cost)
  


@u = @year.estimates.page(params[:page]).per(2)

  @sum = (a.sum(:cost)+b.sum(:cost)+c.sum(:cost)+d.sum(:cost)+e.sum(:cost)+f.sum(:cost)+g.sum(:cost)+h.sum(:cost)+i.sum(:cost)+j.sum(:cost)+k.sum(:cost)+l.sum(:cost))

 end

  # GET /years/new
  def new
    @year = Year.new
  end

  # GET /years/1/edit
  def edit
  end

  # POST /years
  def create
    @year = Year.new(year_params.merge(user_id: current_user.id))

    if @year.save
      redirect_to @year, notice: 'Year was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /years/1
  def update
    if @year.update(year_params)
      redirect_to @year, notice: 'Year was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /years/1
  def destroy
    @year.destroy
    redirect_to years_url, notice: 'Year was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_year
      @year = Year.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
   def year_params
      params.require(:year).permit(:name, :limit,:Saving, januaries_attributes: [:id, :_destroy, :name, :reason, :cost, :occourance],
                                                 februaries_attributes: [:id, :_destroy, :name, :reason, :cost, :occourance],
                                                 marches_attributes: [:id, :_destroy, :name, :reason, :cost, :occourance],
                                                 aprils_attributes: [:id, :_destroy, :name, :reason, :cost, :occourance],
                                                 mays_attributes: [:id, :_destroy, :name, :reason, :cost, :occourance],
                                                 junes_attributes: [:id, :_destroy, :name, :reason, :cost, :occourance],
                                                 julies_attributes: [:id, :_destroy, :name, :reason, :cost, :occourance],
                                                 augusts_attributes: [:id, :_destroy, :name, :reason, :cost, :occourance],
                                                 septembers_attributes: [:id, :_destroy, :name, :reason, :cost, :occourance],
                                                 octobers_attributes: [:id, :_destroy, :name, :reason, :cost, :occourance],
                                                 novembers_attributes: [:id, :_destroy, :name, :reason, :cost, :occourance],
                                                 decembers_attributes: [:id, :_destroy, :name, :reason, :cost, :occourance])


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
