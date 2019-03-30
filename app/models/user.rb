class User < ApplicationRecord
  # validations
  validates :account, presence: true
  validates :account, uniqueness: true

  # association
  has_many :articles
  has_one :user_detail
end
