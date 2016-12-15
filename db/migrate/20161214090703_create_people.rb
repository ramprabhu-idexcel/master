class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :name
      t.integer :parent_id
      t.timestamps
    end
    add_index :people, :parent_id
  end
end
