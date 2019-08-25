class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills, id: false do |t|
      t.string :rfc, null: false
      t.string :uuid, null: false
      t.string :ccyisocode, null: false
      t.integer :place_generated, null: false
      t.datetime :date, null: false
      t.boolean :vigente, null: false
      t.integer :quantity, null: false

      t.timestamps
    end

    execute "ALTER TABLE bills ADD PRIMARY KEY (uuid);"

    add_column :bills,:product_id,:string
    add_foreign_key :bills, :products, column: :product_id, primary_key: "product_id"

    add_column :bills,:emisor_rfc,:string
    add_foreign_key :bills, :businesses, column: :emisor_rfc, primary_key: "rfc"

    add_column :bills,:receptor_rfc,:string
    add_foreign_key :bills, :businesses, column: :receptor_rfc, primary_key: "rfc"
  end
end
