class Review < ApplicationRecord
    belongs_to :place
    belongs_to :user
    has_many :likes, dependent: :destroy

    validates :review, :title, presence: true  

end
