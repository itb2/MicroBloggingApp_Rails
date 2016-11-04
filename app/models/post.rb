class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates_presence_of :user
  validates_presence_of :text
  validates_presence_of :title

end
