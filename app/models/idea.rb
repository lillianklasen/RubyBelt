class Idea < ActiveRecord::Base
  belongs_to :user, required: true
  has_many :likes, dependent: :destroy
  has_many :users_liked, through: :likes, source: :user

  validates :content, presence: true
end
