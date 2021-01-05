class User < ApplicationRecord
    has_many :reviews
    has_many :places, through: :reviews

    validates :username, :name, :date_of_birth,  presence: true    
    
    has_secure_password

end
