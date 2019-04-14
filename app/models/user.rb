class User < ApplicationRecord
  # validations
  validates :account, presence: true
  validates :account, uniqueness: true

  # association
  has_many :articles, dependent: :destroy
  has_one :user_detail, dependent: :destroy
  has_many :user_communities, dependent: :destroy
  has_many :communities, through: :user_communities, dependent: :destroy
end
