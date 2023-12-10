class Address < ApplicationRecord
def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
