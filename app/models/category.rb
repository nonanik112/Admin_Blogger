class Category < ApplicationRecord
  # has_many :posts
  # validates :name, presence: true
  # attr_accessor :category_type
  # has_many :posts, -> { order(:name) }, :dependent => :destroy, :class_name => 'Category'

  has_and_belongs_to_many  :posts

  def to_s
    name
  end
end
