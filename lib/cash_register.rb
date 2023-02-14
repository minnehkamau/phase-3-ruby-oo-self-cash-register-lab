class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction_amount
  
    def initialize(discount=0)
      @total = 0
      @discount = discount
      @items = []
    end
  
    def add_item(title, price, quantity=1)
      self.total += price * quantity
      quantity.times do
        items << title
      end
      self.last_transaction_amount = price * quantity
    end
  
    def apply_discount
      if discount > 0
        self.total = total * ((100.0 - discount.to_f)/100)
        "After the discount, the total comes to $#{self.total.to_i}."
      else
        "There is no discount to apply."
      end
    end
  
    def void_last_transaction
      self.total -= self.last_transaction_amount
      self.last_transaction_amount = 0
    end
  end
  