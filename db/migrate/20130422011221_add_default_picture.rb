class AddDefaultPicture < ActiveRecord::Migration
  def change
  	change_column :pages, :picture, :string, default: "/assets/picture_book.png"
  end
end
