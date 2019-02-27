class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.references :customer, foreign_key: true
      t.references :plan, foreign_key: true
      t.string :token
      t.integer :price

      t.timestamps
    end
  end
end
