class Like < ApplicationRecord
  self.table_name = "likes"

  belongs_to :user
  belongs_to :trade
end
