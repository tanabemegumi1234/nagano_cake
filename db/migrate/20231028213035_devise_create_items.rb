class DeviseCreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      ## Database authenticatable
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at
      t.string :first_name, null: false
      
      t.string :name, null: false #null: false 空白は間違い
      t.text :introduction, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
