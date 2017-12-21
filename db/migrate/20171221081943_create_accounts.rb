class CreateAccounts < ActiveRecord::Migration[5.1]
  
  def change
    
    create_table :accounts do |t|
      t.string :date
      t.string :title
      t.string :amount
      t.timestamps null: false
    end
  end
end
