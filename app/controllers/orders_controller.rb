class OrdersController < ApplicationController

 def index
  @item = Item.find(params[:item_id])
  @purchase_order = PurchaseOrder.new
 end

 def create
  @item = Item.find(params[:item_id])
  @order = PurchaseOrder.new(order_params)
  if @order.valid?
    pay_item
    @order.save
    return redirect_to root_path
  else
    render 'index'
  end
 end

 private

 def order_params
  params.require(:purchase_order).permit(:postal_code, :delivery_area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
 end

 def pay_item
  @item = Item.find(params[:item_id])
  Payjp.api_key = "sk_test_f5430246d8598c973cc6db40" # PAY.JPテスト秘密鍵
  Payjp::Charge.create(
    amount: @item.price,  # 商品の値段
    card: order_params[:token],    # カードトークン
    currency:'jpy'                 # 通貨の種類(日本円)
  )
 end
end