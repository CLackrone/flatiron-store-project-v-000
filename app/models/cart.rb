class Cart < ActiveRecord::Base

  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    @total_price ||= line_items.includes(:item).reduce(0) do |sum, l_item|
      sum + (l_item.quantity * l_item.item.price)
    end
  end

  def add_item(item_id)
    item = self.line_items.find_by(item_id: item_id)
    if item 
      item.quantity += 1
    else
      item = self.line_items.new(item_id: item_id)
    end
    item
  end

end

