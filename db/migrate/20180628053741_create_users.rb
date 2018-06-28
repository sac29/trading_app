class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    drop_table :trades
    create_table :users do |t|
      t.string :username

      t.timestamps
    end
  end
end
