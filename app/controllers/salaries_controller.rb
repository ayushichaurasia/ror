class SalariesController < ApplicationController
    before_action :authenticate_user!
  
    def show
      @salary = Salary.find_by(employee_id: current_user.employee.id, month: params[:month], year: params[:year])
  
      if @salary
        render json: { salary: @salary }
      else
        render json: { error: "Salary not found" }, status: :not_found
      end
    end
  end
  