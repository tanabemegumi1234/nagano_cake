class DeviseCreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.string :name, null: false #null: false 空白は間違い
      t.text :introduction, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
