module ExchangeService

  DOLLAR_TO_YUAN = {
    20 => 168,
    25 => 188,
    30 => 218
  }

  def self.dollar_to_yuan(dollar)
    DOLLAR_TO_YUAN[dollar]
  end
end
