class ShoppingCart < ApplicationRecord
	has_one :user
	has_many :user_tickets
end
