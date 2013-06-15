class MakePagesBookIdInteger < ActiveRecord::Migration
  def up
  	change_column :pages, :book_id, :integer
  end

  def down
  end
end
