class WelcomeController < ApplicationController

def welcome
	@m = Community.find_by(body: 'document').doc.url
  end 


end #End of Class.