class Book < ActiveRecord::Base
  attr_accessible :cover, :title, :book_pages_attributes
  belongs_to :user
  has_many :book_pages, class_name: :Page, dependent: :destroy
  accepts_nested_attributes_for :book_pages, allow_destroy: :true
  before_validation do
  	book_pages.each do |book_page|
  		book_page.book = self
  	end
  end

  validates :user_id, presence: true
  validates :title, presence: true

  default_scope order: 'books.created_at DESC'
end
