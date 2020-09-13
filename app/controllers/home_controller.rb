class HomeController < ApplicationController

  access all: [:home]

  layout "myhome"
    
  def home
  	 @word = Word.last
  end

end
