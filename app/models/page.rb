class Page < ActiveRecord::Base
  attr_accessible :picture, :sound
  belongs_to :book

  validates :book_id, presence: true

  default_scope order: 'pages.page_num DESC'
end
