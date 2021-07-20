class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true 
    validates :password, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :phone_number, presence: true 

    def full_name
        return self.first_name + " " + self.last_name
    end
end
