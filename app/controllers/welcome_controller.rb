class WelcomeController < ApplicationController

	def welcome
	  @m = Community.find_by(body: 'manual').doc.url
    end 

end #End of Class.