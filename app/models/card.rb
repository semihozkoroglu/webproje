class Card < ActiveRecord::Base
	belongs_to :user
	has_many :yukleme
	has_many :harcama
end
