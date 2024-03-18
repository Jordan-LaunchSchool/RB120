class InvoiceEntry
  attr_reader :product_name
	attr_accessor :quantity

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    self.quantity = updated_count if updated_count >= 0
  end
end

new_invoice = InvoiceEntry.new('test', 2)



#The quantity of the invoice can be modified to whatever value from calling quantity setter method. 
