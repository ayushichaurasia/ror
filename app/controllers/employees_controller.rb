class EmployeesController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin, only: [:create, :update, :destroy]
  
    def index
         @employees = Employee.includes(:user).all
    end
      
    def create
      user = User.new(
        email: params[:employee][:email],
        password: "123456",
        password_confirmation: "123456",
        role: params[:employee][:role]
      )
    
      if user.save
        employee = user.create_employee(
          name: params[:employee][:name],
          designation: params[:employee][:designation]
        )
    
        if params[:employee][:salary].present?
          employee.create_salary(
            amount: params[:employee][:salary],
            month: Date.today.month,
            year: Date.today.year
          )
        end
    
        redirect_to employees_path, notice: "Employee Added Successfully"
      else
        Rails.logger.debug "User Save Error: #{user.errors.full_messages}"
        @employees = Employee.includes(:user).all
        @employee = Employee.new
        flash[:alert] = "Error: " + user.errors.full_messages.join(", ")
        render :index
      end
    end
        
    def edit
      @employee = Employee.find(params[:id])
    end
  
    def update
      @employee = Employee.find(params[:id])
      
      current_month = Date.today.month
      current_year = Date.today.year

      if params[:employee][:salary_attributes].present? && !params[:employee][:salary_attributes][:month].present?
        params[:employee][:salary_attributes][:month] = current_month
        params[:employee][:salary_attributes][:year] = current_year
      end
      
      if @employee.update(employee_params)
        redirect_to employees_path, notice: "Employee updated successfully."
      else
        render :edit, status: :unprocessable_entity
      end
    end
    
  
    def destroy
      @employee = Employee.find(params[:id])
      @employee.destroy
      redirect_to employees_path, notice: "Employee Deleted Successfully"
    end
  
    private

    def employee_params
        params.require(:employee).permit(:name, :designation, salary_attributes: [:amount, :month, :year])
      end
      
end