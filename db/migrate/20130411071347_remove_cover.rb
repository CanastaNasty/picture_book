class RemoveCover < ActiveRecord::Migration
  def up
  	change_table :books do |t|
  		t.remove :cover
  	end
  end

  def down
  	change_table :books do |t|
  		t.string :cover
  	end
  end
end
