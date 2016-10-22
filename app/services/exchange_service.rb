module ExchangeService

  DOLLAR_TO_YUAN = {
    20 => 138,
    25 => 172,
    30 => 208
  }

  def self.dollar_to_yuan(dollar)
    DOLLAR_TO_YUAN[dollar]
  end
end
