class Public::CartItemsController < ApplicationController
def create
  @cart_item = CartItem.new(cart_item_params)
  @cart_item.customer_id = current_customer.id
  @cart_item.save!
  redirect_to  cart_items_path
  
  @cart_items=current_customer.cart_items.all
  @cart_items.each do |cart_item|
  if cart_item.item_id==@cart_item.item_id
  new_amount = cart_item.amount + @cart_item.amount
  cart_item.update_attribute(:amount, new_amount)
  @cart_item.delete
  end
end
end
def index
  @cart_items = current_customer.cart_items
  @total=0
  @cart_item = CartItem.all
end

def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_back(fallback_location: root_path)
end

def destroy_all
    CartItem.destroy_all
    redirect_back(fallback_location: root_path)
end

def destroy
  cart_item = CartItem.find(params[:id])  # データ（レコード）を1件取得探す
  cart_item.destroy  # データ（レコード）を削除
  redirect_to '/cart_items'  # 投稿一覧画面へリダイレクト  
end


private
 
def cart_item_params
  params.require(:cart_item).permit(:item_id, :amount)
end

end
