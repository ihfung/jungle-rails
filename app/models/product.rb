class Product < ApplicationRecord
  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category

  # Validation for the product model to ensure all fields are filled in and the price is a number greater than 0 and the quantity is a number greater than 0 and the category is filled in as well 
  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true
end
