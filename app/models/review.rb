class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :meal
	has_many :ratings
	has_many :comments
end
