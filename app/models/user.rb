class User < ActiveRecord::Base
    has_many :ideas, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :ideas_liked, through: :likes, source: :idea


    has_secure_password

    validates :name, :alias, :email, length: { minimum: 2 }

    validates :password, presence: { on: :create }, length: { minimum: 2, allow_blank: true }

    validates :email, uniqueness: true

    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

    validates_presence_of :password_confirmation, if: :password_digest_changed?
end
