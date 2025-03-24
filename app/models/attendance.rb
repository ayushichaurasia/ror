class Attendance < ApplicationRecord
  belongs_to :employee

  validates :month, presence: true
  validates :year, presence: true
  validates :unpaid_leaves, presence: true, numericality: { greater_than_or_equal_to: 0 }

  validates :month, uniqueness: { scope: [:employee_id, :year] }

  before_create :ensure_daily_attendance

  private

  def ensure_daily_attendance
    self.daily_attendance ||= {}

    days_in_month = Date.new(year, month, -1).day
    (1..days_in_month).each do |day|
      self.daily_attendance[day.to_s] ||= "✖"  # Default Absent
    end
  end
end
