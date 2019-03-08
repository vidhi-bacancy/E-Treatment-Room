class ApplicationController < ActionController::Base
    #before_action :set_paper_trail_whodunnit
	protect_from_forgery with: :exception   
    private   
    def current_user  
      Patient.where(id: session[:checkuser_id] ).first   
    end   
    helper_method :current_user
  
    def current_doc
      Doctor.where(id: session[:checkdoc_id] ).first   
    end   
    helper_method :current_doc
 
    def current_admin
      Admin.where(id: session[:checkadmin_id] ).first   
    end   
    helper_method :current_admin
end