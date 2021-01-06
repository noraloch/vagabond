class User < ApplicationRecord
    has_many :reviews
    has_many :places, through: :reviews
    has_many :likes, dependent: :destroy

    validates :username, :name, :date_of_birth,  presence: true    
    validates :username, uniqueness: {case_sensitive: false, message: "Username already exits"}

    
    has_secure_password

end
