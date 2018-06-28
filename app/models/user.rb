class User < ApplicationRecord
    self.table_name = 'users'
    validates :username, presence: true, length: {minimum: 4} 
end
