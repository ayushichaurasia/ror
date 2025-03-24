class Salary < ApplicationRecord
  belongs_to :employee
  
  validates :month, presence: true
  validates :year, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }

  validates :month, uniqueness: { scope: [:employee_id, :year] }
end