# frozen_string_literal: true

class DeviseCreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      ## Database authenticatable


      t.timestamps null: false
    end

 
  end
end
