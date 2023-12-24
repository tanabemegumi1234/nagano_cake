class Item < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, through: :order_details
  has_one_attached :item_image

  # def get_item_image
  #   unless item_image.attached?
  #   item_path = Rails.root.join('app/assets/images/no_image.jpg')
  #   item_image.attach(io: File.open(item_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  #   end
  #   item_image.variant(resize_to_limit: [50, 50]).processed
  # end

  def get_item_image(width, height)
    unless item_image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      item_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    item_image.variant(resize_to_limit: [width, height]).processed
  end

  def with_tax_price
  (price * 1.1).floor
  end

end
