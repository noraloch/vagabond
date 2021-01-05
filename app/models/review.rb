class Review < ApplicationRecord
    belongs_to :place
    belongs_to :user

    validates :review, :title, presence: true  

    
end
