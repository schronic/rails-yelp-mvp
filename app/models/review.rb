class Review < ApplicationRecord
  validates :rating,  numericality: { only_integer: true }, inclusion: { in: [0, 1, 2, 3, 4, 5] }
  validates :restaurant_id, presence: true
  validates :content, presence: true
  validates :rating, presence: true
  belongs_to :restaurant

end
