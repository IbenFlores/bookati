class Book < ApplicationRecord
  belongs_to :seller

  validates :title, :description, :author, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
