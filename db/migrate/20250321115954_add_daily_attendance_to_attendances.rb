class AddDailyAttendanceToAttendances < ActiveRecord::Migration[7.1]
  def change
    add_column :attendances, :daily_attendance, :json
  end
end
