class Admin::AttendancesController < ApplicationController  # Change from AttendanceController to AttendancesController
    before_action :authenticate_user!
    before_action :check_admin

    skip_before_action :verify_authenticity_token, only: [:update_attendance]

    def index
      @employees = Employee.includes(:attendances)
    end

    def create
      @attendance = Attendance.new(attendance_params)
      if @attendance.save
        render json: { message: "Attendance record created successfully" }, status: :created
      else
        render json: { errors: @attendance.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def update_attendance
      attendance = Attendance.find_or_initialize_by(
        employee_id: params[:id],
        month: attendance_params[:month],
        year: Date.today.year
      )
    
      # Ensure daily_attendance is always a Hash
      attendance.daily_attendance = (attendance.daily_attendance || {}).merge(attendance_params[:daily_attendance] || {})
    
      if attendance.save
        render json: { message: "Attendance updated successfully" }
      else
        render json: { error: "Failed to update attendance", errors: attendance.errors.full_messages }, status: :unprocessable_entity
      end
    end
    

    private

    def attendance_params
      params.require(:attendance).permit(:month, daily_attendance: {})
    end
    
    def check_admin
      unless current_user.admin?
        render json: { error: "Unauthorized" }, status: :forbidden
      end
    end
  end

