
require 'pry'

class CashRegister
  attr_accessor :total, :discount

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @item_arr ||= []
    @price_arr ||=[]
  end

  def add_item(title, price, quantity=1)
    quantity.times do
      @item_arr << title
    end
    @price_arr << price
    @title = title
    @price = price
    @total += price*quantity
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      @total= @total-(@total*(discount/100.00))
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def items
    @item_arr
  end

  def void_last_transaction
    @total = @total - @price_arr[-1]
  end
end
