class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items
  has_many :carts, :through => :line_items

  def self.available_items
    @items = []
    self.all.each do |item|
      if item.inventory > 0
        @items << item
      end
    end
    @items
  end

end
