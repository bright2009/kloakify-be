class CreateSentDocuments < ActiveRecord::Migration[7.1]
  def change
    create_table :sent_documents do |t|
      t.references :document, null: false, foreign_key: true
      t.references :sender, null: false, foreign_key: true
      t.references :recipient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
