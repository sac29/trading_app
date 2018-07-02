class User < ApplicationRecord
    self.table_name = 'users'

    has_many :likes
    
    validates :username, presence: true, length: {minimum: 4} 
end
