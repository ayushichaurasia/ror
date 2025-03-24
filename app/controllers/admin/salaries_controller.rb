module Admin
    class SalariesController < ApplicationController
      before_action :authenticate_user!
      before_action :authorize_admin
  
      def index
        @employees = Employee.includes(:salaries)
      end
  
      def update
        salary = Salary.find(params[:id])
        if salary.update(salary_params)
          render json: { success: "Salary updated successfully" }
        else
          render json: { error: salary.errors.full_messages }, status: :unprocessable_entity
        end
      end
  
      private
  
      def salary_params
        params.require(:salary).permit(:amount, :month, :year, :employee_id)
      end
  
      def authorize_admin
        unless current_user.admin?
          render json: { error: "Unauthorized" }, status: :forbidden
        end
      end
    end
  end
  