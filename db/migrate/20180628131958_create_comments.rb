class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.bigint :user_id, :null => :false
      t.bigint :trade_id, :null => :false
      t.string :user_comment, :null => :false
      
      t.timestamps
    end
  end
end
