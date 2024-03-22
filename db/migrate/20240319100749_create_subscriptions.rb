class CreateSubscriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :subscriptions do |t|
      t.string :subscription_type
      t.integer :send_limit
      t.integer :receive_limit
      t.integer :size_limit
      t.boolean :automated_transfer
      t.boolean :bulk_sharing
      t.boolean :multiple_tracking
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
