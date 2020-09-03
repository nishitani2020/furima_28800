class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :find_item, only: :order

  def index
    @items = Item.all
    @items = Item.all.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def order
    Purchase.create(item_id: params[:id])
  end

  private

  def find_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :status_id, :delivery_cost_id, :delivery_area_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end
end
