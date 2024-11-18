class Article < ApplicationRecord
  has_one_attached :image  # Adds an Active Storage attachment for the image
  include Visible


  # Example validations (optional)
  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }
end
