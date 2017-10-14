class LineItemsController < ApplicationController


def create
	Line_item.new(line_item_params).save
end

private

  def line_item_params
    params.require(:line_item).permit(:item_id, :cart_id, :quantity)
  end

end
