class DepositSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :tradeline_id, :deposit_date, :amount
  belongs_to :tradeline, serializer: TradelineSerializer
end
