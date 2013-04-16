class Book < ActiveRecord::Base
  attr_accessible :cover, :title, :pages_attributes
  belongs_to :user
  has_many :pages, dependent: :destroy
  accepts_nested_attributes_for :pages, allow_destroy: :true
  before_validation do
  	pages.each do |page|
  		page.book = self
  	end
  end

  validates :user_id, presence: true
  validates :title, presence: true

  default_scope order: 'books.created_at DESC'
end
