class CartItem < ApplicationRecord
	belongs_to :end_user
	belongs_to :item

	def add_again_amount(additional_amount)
		self.amount += (additional_amount).to_i
		self.update(amount: self.amount)
	end
end
