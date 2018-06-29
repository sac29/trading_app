class Comment < ApplicationRecord
    self.table_name = "comments"
   
    belongs_to :trade, class_name: 'Trade'
    belongs_to :user, class_name: 'User'
    
    validates :user_id, :presence => true
    validates :trade_id, :presence => true
    validates :user_comment, :presence => true, :length => { :minimum => 1 }
end
