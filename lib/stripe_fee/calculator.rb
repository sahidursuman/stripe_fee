module StripeFee
  class Error < StandardError; end
  class AmountError < ArgumentError; end
  class CurrencyError < ArgumentError; end

  class Calculator

    def initialize amount:, currency: 'usd'
      @amount = amount
      @currency = currency
    end

    def validate!
      raise ::AmountError unless @amount.to_f && @amount.to_f > 0
      raise ::CurrencyError unless @currency == 'usd'
    end

    def amount_in_cents
      @amount.to_f * 100
    end

    def charge_amount_in_cents
      validate!
      ((amount_in_cents + 30)/(1 - 0.029)).round
    end
  end

end