require 'rails_helper'

RSpec.describe Api::V1::TradelinesController, type: :controller do
  describe '#index' do
    it 'responds with a 200' do
      get :index

      expect(response).to have_http_status(:ok)
    end

    it 'shows a variety of tradelines and their amounts' do
      tradeline_1 = FactoryBot.create(:tradeline, name: "Credit Card", amount: 1000)
      tradeline_2 = FactoryBot.create(:tradeline, name: "House", amount: 3000)

      deposit_1 = FactoryBot.create(:deposit, amount: 100, tradeline_id: tradeline_1.id)
      get :index
      
      expect(response).to have_http_status(:ok)
      
      tradelines = JSON.parse(response.body, symbolize_names: true)

      expect(tradelines.class).to eq(Hash)
      expect(tradelines[:data].class).to eq(Array)
    end
  end

  describe '#show' do
      tradeline_1 = FactoryBot.create(:tradeline, name: "Credit Card", amount: 1000)
      tradeline_2 = FactoryBot.create(:tradeline, name: "House", amount: 3000)

      deposit_1 = FactoryBot.create(:deposit, amount: 100, tradeline_id: tradeline_1.id)

    it 'responds with a 200' do
      get :show, params: { id: tradeline_1.id }

      tradelines = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:ok)
    end

    context 'if the loan is not found' do
      it 'responds with a 404' do
        get :show, params: { id: 1000 }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
