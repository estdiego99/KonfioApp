class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses, id: false do |t|
      t.string :rfc, null: false
      t.string :name

      t.timestamps
    end

    execute "ALTER TABLE businesses ADD PRIMARY KEY (rfc);"
  end
end
