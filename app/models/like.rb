class Like < ApplicationRecord
  belongs_to :user_id
  belongs_to :review_id
  validates :user_id, uniqueness: {scope: :review_id}
end
