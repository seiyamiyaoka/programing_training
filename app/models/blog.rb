class Blog < ApplicationRecord
  belongs_to :writer

  has_many :comments, dependent: :destroy
end
