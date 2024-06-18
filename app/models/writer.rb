class Writer < ApplicationRecord
  has_many :blogs
  has_many :comments
  has_many :favorites
  has_many :favorite_blogs, through: :favorites, source: :blog

  enum genre: { fiction: 0, non_fiction: 1, poetry: 2 }

  def my_blog_comments
    blogs.joins(:comments)
  end
end
