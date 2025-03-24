class DashboardController < ApplicationController
    before_action :authenticate_user!

    def index
        if current_user.role == "admin"
            @employees = Employee.all
            @salaries = Salary.all
            @attendance = Attendance.all
        else
            @salary = Salary.find_by(employee: current_user)
            @attendance = Attendance.find_by(employee: current_user)
        end
    end
end
