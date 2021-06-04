module DeviseWhitelist
	extend ActiveSupport::Concern
    
    included do
    	before_action :configure_permitted_parameters, if: :devise_controller?
    end 

    def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :roles, :colour, :theme, :subscribe, :email, :branding ])
		devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :roles, :colour, :theme, :heading, :headingimg, :subscribe, :branding, bookmarks_attributes: [:id, :bname, :dname, :user_id ], visits_attributes: [:id, :img, :country, :schedule, :description]])
	end

	

end 

