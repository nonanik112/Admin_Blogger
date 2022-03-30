class Post < ApplicationRecord
  validates :title, :body, presence: true
  validates :title, :uniqueness => true
  validates :title, :length => { :maximum => 65}

  has_and_belongs_to_many  :categories
  belongs_to :author

  has_one_attached :image



  scope :published, ->{ where.not(published_at: nil) }
  scope :unpublished, ->{ where(published_at: nil) }

  def to_s
    title
  end
  def post_parms
    	params.require(:post).permit(:title, :body, :category_id, :author_id)
  end
end
