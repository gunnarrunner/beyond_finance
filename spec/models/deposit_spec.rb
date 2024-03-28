require 'rails_helper'

RSpec.describe Deposit, type: :model do
  describe 'relationships' do
    it { should belong_to(:tradeline) }
  end

  describe 'validations' do
    it { should validate_presence_of(:deposit_date) }
  end

  # describe 'class methods' do
  #  describe '.' do
  #   end
  # end

  # describe 'instance methods' do
  #   describe '#' do
  #   end
  # end
end