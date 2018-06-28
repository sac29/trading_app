class CreateTrades < ActiveRecord::Migration[5.2]
  def change
    drop_table :trades
    create_table :trades do |t|
      t.string :stock_name, :null => :false
      t.bigint :user_id, :null => :false
      t.decimal :stock_price, :precision => 10, :null => :false, :scale => 2
      t.integer :no_of_shares, :null => :false
      # t.boolean :sold, :null => :false
      t.string :order_type, :null => :false
      t.timestamps
    end
  end
end
