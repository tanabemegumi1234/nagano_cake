class Public::OrdersController < ApplicationController
def new
  @order = Order.new
  @customer = current_customer
end

def confirm
  @customer = current_customer
  @cart_items = current_customer.cart_items
  @total=0
  @cart_item = CartItem.all
  @order = Order.new(order_params)
  
  
end

def thanx

end

def create
  @order = Order.new(order_params)
  @order.save
  
  @cart_items = current_customer.cart_items.all
  @cart_items.each do |cart_item|
  @order_details = OrderDetail.new
  @order_details.order_id = @order.id
  @order_details.item_id = cart_item.item.id
  @order_details.purchase_price = cart_item.item.price # 良くわからん？？間違えてるかも
  @order_details.amount = cart_item.amount
  @order_details.save!
  end
  
  CartItem.destroy_all #カート内商品の情報を全て削除する
  redirect_to orders_thanx_path
  
end

def index
 @order = current_customer.orders
 
end

def show
 @order = Order.find(params[:id])
 @order_detail = @order.order_details
 @total = 0
end

private
 
def order_params
  params.require(:order).permit(:payment_method, :customer_id, :postage, :shipping_postal_code, :total_billing_amount, :shipping_address, :shipping_name)
end

def cartitem_nill
    cart_items = current_customer.cart_items
    if cart_items.blank?
      
    redirect_to items_path
    end
end
end
