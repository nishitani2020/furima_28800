class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create!(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :status_id, :delivery_cost_id, :delivery_area_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end
end