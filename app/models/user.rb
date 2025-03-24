class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { admin: 0, employee: 1 }
  
  has_one :employee, dependent: :destroy
end