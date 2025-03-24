class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    
    private
    
    def authorize_admin
      unless current_user.admin?
        redirect_to root_path, alert: 'Unauthorized access'
      end
    end
    
    def authorize_employee
      unless current_user.employee?
        redirect_to root_path, alert: 'Unauthorized access'
      end
    end
  end