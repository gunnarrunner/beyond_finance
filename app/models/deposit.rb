class Deposit < ApplicationRecord
  belongs_to :tradeline

  validates :deposit_date, presence: true
  validates :amount, numericality: { less_than_or_equal_to: :tradeline_outstanding_balance }

  def tradeline_outstanding_balance
    tradeline.outstanding_balance
  end
end