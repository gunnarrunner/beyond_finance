class Api::V1::TradelinesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  before_action :set_tradelines, only: :index
  before_action :set_tradeline, only: :show

  def index
    render json: TradelineSerializer.new(@tradelines)
  end

  def show
    render json: TradelineSerializer.new(@tradeline)
  end

  private

  def not_found
    render json: 'not_found', status: :not_found
  end

  def set_tradelines
    @tradelines = Tradeline.all
  end

  def set_tradeline
    @tradeline = Tradeline.find(params[:id])
  end
end
