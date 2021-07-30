class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true 
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :phone_number, presence: true 

    def full_name
        return self.first_name + " " + self.last_name
    end

    def filtered_information 
        return {full_name: self.full_name,
                id: self.id,
                is_admin: self.is_admin
            }
    end
end
