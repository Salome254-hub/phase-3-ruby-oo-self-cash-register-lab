class CashRegister
    attr_accessor :total, :register
    attr_reader :discount
    def initialize(discount = 0)
      @total = 0
      @discount = discount
      @register = []
    end
    def add_item(title, price, quantity = 1)
      @total += price * quantity
      quantity.times { @register.push({ title: title, price: price, quantity: quantity }) }
    end
    def apply_discount
      if @discount > 0
        savings = @total * @discount / 100
        @total -= savings
        "After the discount, the total comes to $#{@total}."
      else
        "There is no discount to apply."
      end
    end
    def items
      @register.map { |item| item[:title] }
    end
    def void_last_transaction
      last_transaction = register.pop
      @total -= last_transaction[:price] * last_transaction[:quantity]
    end
  end