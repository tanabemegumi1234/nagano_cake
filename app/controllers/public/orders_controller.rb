class Public::OrdersController < ApplicationController
def new
  @order = Order.new
  @customer = current_customer 
end

def confirm
  @order = Order.new(order_params)
  @customer = current_customer 
  @cart_items = current_customer.cart_items
  @total=0
  @cart_item = CartItem.all

end

def thanx
  
end

def create
  
end

def index
  
end

def show
  
end

end
