require 'pry'

class CashRegister
	attr_accessor :total
	attr_accessor :discount

  	def initialize(discount = nil)
    	@discount = discount
    	@total = 0
    	@items = []
    	@price = []
			@last_item_price = 0
  	end

  	def items
  		@items
  	end

  	def price
  		@price
  	end

		def last_item_price
  		@last_item_price
  	end

  	def add_item(title, price, quantity=1)

  			price = quantity * price
  			quantity.times{@items.push(title)}
				#set price for removing last item
				@last_item_price = self.total
				#set total
		    self.total = self.total + price
				#set price for removing last item
				@last_item_price = self.total
		end

    def apply_discount
  		if @discount == 0 || @discount == nil
  			"There is no discount to apply."
  		elsif @discount > 0
  			discount_amount = self.total * (self.discount.to_f/100)
  			@total = self.total.to_f - discount_amount.to_f
        "After the discount, the total comes to $#{@total.to_i}."
      else
        "There is no discount to apply."
      end

  	end


		def void_last_transaction
		      @total = self.total.to_f - self.last_item_price.to_f
  	end

end

cash_register = CashRegister.new
cash_register.total = 100

cash_register_with_new = CashRegister.new(20)
