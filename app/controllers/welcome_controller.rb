class WelcomeController < ApplicationController


  def welcome
    @manual = Community.find_by(body: "manual").doc.url
  end 

end
