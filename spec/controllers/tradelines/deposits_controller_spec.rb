require 'rails_helper'

RSpec.describe Api::V1::DepositsController, type: :controller do
  describe '#create ' do
    let(:tradeline) { FactoryBot.create :tradeline }
    let(:params) { { deposit: { amount: 100, deposit_date: Date.tomorrow, tradeline_id: tradeline.id }, tradeline_id: tradeline.id } }
    let(:params_1) { { deposit: { amount: 100, deposit_date: Date.tomorrow, tradeline_id: 10 }, tradeline_id: 10 } }
    let(:params_2) { { deposit: { amount: 4000, deposit_date: Date.tomorrow, tradeline_id: tradeline.id }, tradeline_id: tradeline.id } }


    it 'responds with a 200' do
      post :create, params: params
      expect(response).to have_http_status(:ok)
    end

    it 'responds with a 400 if deposit exceeds the tradeline amount' do      
      post :create, params: params_2
      expect(response).to have_http_status(400)
    end
  end
end