  class ResearchesController < ApplicationController
      
      before_action :authenticate_user!
      before_action :set_research, only: [:show, :edit, :update, :destroy]
    access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all
      layout :determine_layout
    # GET /researches
    def index
      @researches = Research.page(params[:page])
              

      @sorted_researches = Research.all
      

        respond_to do |format|
        format.html
        format.pdf do
        pdf = JournalPdf.new(@sorted_researches)
        send_data pdf.render, filename: "Journal.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end


    end

    # GET /researches/1
    def show
    end

    # GET /researches/new
    def new 
      @research = Research.new
    end

    # GET /researches/1/edit
    def edit
    end

    # POST /researches
    def create
      @research = Research.new(research_params.merge(user_id: current_user.id))

      if @research.save
        redirect_to researches_path, notice: 'Research was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /researches/1
    def update
      if @research.update(research_params)
        redirect_to researches_path, notice: 'Research was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /researches/1
    def destroy
      @research.destroy
      redirect_to researches_url, notice: 'Research was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_research
        @research = Research.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def research_params
        params.require(:research).permit(:mainheading, :subheading, :contributed, :body, :Image)
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
