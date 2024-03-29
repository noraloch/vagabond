class Review < ApplicationRecord
    belongs_to :place
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy

    validates :review, :title, presence: true  

    mount_uploader :image, ImageUploader

end
