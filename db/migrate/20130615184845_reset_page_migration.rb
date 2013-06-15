class ResetPageMigration < ActiveRecord::Migration
  def change
  	drop_table :pages
  	create_table :pages do |t|
  	  t.string :picture
      t.string :sound
      t.integer :book_id
      t.integer :page_num

      t.timestamps
    end
    add_index :pages, [:book_id, :page_num]
  end
end
