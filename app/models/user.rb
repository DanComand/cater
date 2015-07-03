class User < ActiveRecord::Base
	has_secure_password
	has_many :reviews
	has_many :meals, through: :reviews
end
