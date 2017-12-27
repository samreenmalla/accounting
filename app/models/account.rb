class Account < ApplicationRecord
	validates :date, presence: true
	validates :title, presence: true
	validates :amount, numericality:{only_integer: true} , presence: true

end
