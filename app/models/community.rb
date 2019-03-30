class Community < ApplicationRecord
  # association
  has_many :user_communities
  has_many :users, through: :user_communities
end
