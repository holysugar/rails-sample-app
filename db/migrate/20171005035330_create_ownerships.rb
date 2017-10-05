class CreateOwnerships < ActiveRecord::Migration[5.1]
  def change
    create_table :ownerships do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.integer :number

      t.timestamps
    end
  end
end
