class OrdersController < ApplicationController

 def index
  @item = Item.find_by(params[:item_id])
 end

 def create
 end

end
