class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name
      t.string :description
      t.belongs_to :list, index: true
      t.boolean :archived

      t.timestamps
    end
  end
end
