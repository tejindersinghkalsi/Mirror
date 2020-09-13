class HomeController < ApplicationController

  before_action :authenticate_user!
  access all: [:home]

  layout "myhome"
    
  def home
  	 @word = Word.last
  end

end
