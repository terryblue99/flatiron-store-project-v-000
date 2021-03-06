class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, :through => :line_items

  def total

    line_items.collect {|i| i.item.price * i.quantity}.inject(:+)

  end

  def add_item(item_id)

    item = Item.find(item_id)
    line_item = line_items.detect {|li| li.item == item}

    if line_item
      line_item.quantity += 1
    else
      new_line_item = LineItem.new
      new_line_item.cart_id = self.id
      new_line_item.item_id = item_id
      new_line_item.quantity = 1
    end

    line_item ||= new_line_item

  end

  def cart_checkout
    
    self.line_items.each do |line_item|
      item = line_item.item
      item.inventory = line_item.item.inventory - line_item.quantity
      item.save 
    end
    
  end  

end
