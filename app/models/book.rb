class Book < ActiveRecord::Base
  attr_accessible :cover, :title
  belongs_to :user
  has_many :pages, dependent: :destroy

  validates :user_id, presence: true
  validates :title, presence: true

  default_scope order: 'books.created_at DESC'
end
