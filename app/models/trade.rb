class Trade < ApplicationRecord
        self.table_name = 'trades'

        belongs_to :user, class_name: 'User'
        has_many :comments
        
        validates :user_id, presence: true
        validates :stock_name, :presence => true, :length => { :minimum => 1 }
        validates :stock_price, :presence => true, :numericality => true 
        validates :no_of_shares, :presence => true , :numericality => { :only_integer => true, :greater_than => 0}
        
end
