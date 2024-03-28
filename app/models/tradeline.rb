class Tradeline < ApplicationRecord
  has_many :deposits

  validates :name, presence: true
  validates :amount, presence: true, numericality: true

  def outstanding_balance
    deposit = deposits ? deposits.sum(:amount) : 0
    amount - deposit
  end
end
