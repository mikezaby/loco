class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.belongs_to :board, index: true
      t.string :name
      t.boolean :archived
      t.integer :position

      t.timestamps
    end
  end
end
