class CreateReceivedDocuments < ActiveRecord::Migration[7.1]
  def change
    create_table :received_documents do |t|
      t.references :document, null: false, foreign_key: true
      t.references :sender, null: false, foreign_key: { to_table: :users }
      t.references :recipient, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
