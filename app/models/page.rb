class Page < ActiveRecord::Base
  attr_accessible :picture, :sound, :page_num
  belongs_to :book

  validates :book, presence: true
end
