class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :branch
      t.text :address
      t.string :phone_no
      t.string :city

      t.timestamps
    end
  end
end
