class User < ApplicationRecord
	has_many :posts
	has_many :comments
	validates_presence_of :email
	validates :email, uniqueness: true
	validates_presence_of :password
	validates_presence_of :fname
	validates_presence_of :lname
	validates :email, uniqueness: true
end
