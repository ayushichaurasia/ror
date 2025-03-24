class InvestmentsController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_employee, only: [:create, :update]
  
    def create
      investment = current_user.employee.investments.new(investment_params) 
      if investment.save
        render json: { message: 'Investment declaration added successfully', investment: investment }, status: :created
      else
        render json: { errors: investment.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def update
      investment = current_user.employee.investments.find_by(id: params[:id]) 
      if investment&.update(investment_params)
        render json: { message: 'Investment declaration updated successfully', investment: investment }
      else
        render json: { errors: investment&.errors&.full_messages || ["Investment not found"] }, status: :unprocessable_entity
      end
    end
  
    private
  
    def investment_params
      params.require(:investment).permit(:financial_year, :amount)
    end
  
    def authorize_employee
      unless current_user.employee.present?
        render json: { error: 'Unauthorized access' }, status: :forbidden
      end
    end
  end
  