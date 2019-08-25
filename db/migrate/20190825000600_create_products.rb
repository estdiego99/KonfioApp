class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products, id: false do |t|
      t.string :product_id, null: false
      t.float :cost, null: false

      t.timestamps
    end

    execute "ALTER TABLE products ADD PRIMARY KEY (product_id);"
  end
end
