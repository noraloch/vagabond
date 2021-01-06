class User < ApplicationRecord
    has_many :reviews
    has_many :places, through: :reviews

    validates :username, :name, :date_of_birth,  presence: true    
    validates :username, uniqueness: {case_sensitive: false, message: "Username already exits"}

    mount_uploader :image, ImageUploader

    has_secure_password

end
