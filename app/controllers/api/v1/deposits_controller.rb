class Api::V1::DepositsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  before_action :set_tradeline, only: :create

  def create
    deposit = @tradeline.deposits.new(deposit_params)
    # require "pry"; binding.pry
    if deposit.save
      render json: DepositSerializer.new(deposit)
    else
      render json: { errors: deposit.errors.full_messages }, status: 400
    end
  end

  private

  def not_found
    render json: 'not_found', status: :not_found
  end

  def set_tradeline
    @tradeline = Tradeline.find_by(params[:tradeline_id])
  rescue ActiceRecord::RecordNotFound
    not_found
  end

  def deposit_params
    params.require(:deposit).permit(:amount, :deposit_date)
  end
end
