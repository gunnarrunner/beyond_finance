class TradelineSerializer
  include FastJsonapi::ObjectSerializer
  has_many :deposits, serializer: DepositSerializer

  attributes :name, :amount, :outstanding_balance
end
