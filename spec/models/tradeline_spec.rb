require 'rails_helper'

RSpec.describe Tradeline, type: :model do
  describe 'relationships' do
    it { should have_many(:deposits) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:amount) }
    it { should validate_numericality_of(:amount) }
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