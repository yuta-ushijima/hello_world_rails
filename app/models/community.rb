class Community < ApplicationRecord
  # association
  has_many :user_communities, dependent: :destroy
  has_many :users, through: :user_communities, dependent: :destroy
end
