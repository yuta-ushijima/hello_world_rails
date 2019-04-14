class Article < ApplicationRecord
  # association
  belongs_to :user

  enum post_status: { draft: 0, published: 1 }
end
