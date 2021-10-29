  class VisitsController < ApplicationController

    before_action :authenticate_user!
      before_action :set_visit, only: [:destroy]


    # DELETE /words/1
    def destroy
      @visit.destroy
      redirect_to home_url, notice: 'Visit was successfully destroyed.'
    end

     def set_visit
        @visit = Visit.find(params[:id])
      end

  end
