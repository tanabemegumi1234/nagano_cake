class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end
end
