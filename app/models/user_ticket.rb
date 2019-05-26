class UserTicket < ApplicationRecord
  belongs_to :user
  belongs_to :ticket
  belongs_to :shopping_cart
end
