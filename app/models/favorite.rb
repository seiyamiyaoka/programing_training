class Favorite < ApplicationRecord
  belongs_to :writer
  belongs_to :blog
end
