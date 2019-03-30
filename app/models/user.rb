class User < ApplicationRecord
  # validations
  validates :account, presence: true
  validates :account, uniqueness: true
end
