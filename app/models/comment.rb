class Comment < ApplicationRecord
  belongs_to :blog
  belongs_to :writer

  def self.visible_comments
    where(is_visible_author: true)
  end

  def self.invisible_comments
    where(is_visible_author: false)
  end

  def self.visible_comments_by_author(author)
    where(writer: author, is_visible_author: true)
  end

  def self.invisible_comments_by_author(author)
    where(writer: author, is_visible_author: false)
  end

end
