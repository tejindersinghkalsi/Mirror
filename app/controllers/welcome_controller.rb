class WelcomeController < ApplicationController


  def welcome
    @manual = Community.where(body: "manual")
  end 

end
