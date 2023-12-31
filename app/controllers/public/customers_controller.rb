class Public::CustomersController < ApplicationController
  
  def show
    @customer = current_customer 
  end
  
  def edit
    @customer = current_customer 
  end
  
  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_my_page_path(@customer), notice: "登録情報が更新されました。"
    else
      render :edit
    end
  end
  
  def withdraw
    @customer = Customer.find(current_customer.id)
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
  
  private
  # ストロングパラメータ
  def customer_params
    params.require(:customer).permit(:last_name, :last_name_kana, :first_name, :first_name_kana, :postal_code, :telephone_number, :email, :address )
  end
end
 