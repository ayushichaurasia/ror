class Investment < ApplicationRecord
  belongs_to :employee

  validates :financial_year, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

  validates :financial_year, uniqueness: { scope: :employee_id }
end
