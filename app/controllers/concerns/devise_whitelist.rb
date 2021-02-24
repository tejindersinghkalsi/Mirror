module DeviseWhitelist
	extend ActiveSupport::Concern
    
    included do
    	before_action :configure_permitted_parameters, if: :devise_controller?
    end 

    def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :roles, :colour, :theme, :subscribe, :email])
		devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :roles, :colour, :theme, :subscribe, bookmarks_attributes: [:id, :bname, :dname, :user_id ]])
	end

	

end 

