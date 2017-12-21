class Account < ApplicationRecord
	validates :date, :title, :amount, presence: true

end
