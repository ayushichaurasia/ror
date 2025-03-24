class Employee < ApplicationRecord
  belongs_to :user, optional: false, dependent: :destroy  
  has_one :salary, dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_many :investments, dependent: :destroy 
  accepts_nested_attributes_for :salary
  delegate :email, :role, to: :user, allow_nil: true
end
