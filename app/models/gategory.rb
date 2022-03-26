class Gategory < ApplicationRecord
  def category_params
    params.require(:qategory).permit(:name)
  end
  has_many :posts
end
