# frozen_string_literal: true

class DeviseCreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      ## Database authenticatable


      t.timestamps null: false
      t.integer :total_billing_amount, null: false
      t.integer :payment_method, null: false
      t.integer :postage, null: false
      t.string :shipping_postal_code, null: false
      t.string :shipping_address, null: false
      t.string :shipping_name, null: false
    end

 
  end
end
