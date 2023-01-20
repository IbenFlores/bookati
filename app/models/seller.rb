class Seller < ApplicationRecord
  belongs_to :user
  has_many :books, dependent: :destroy

  validates :phone_number, presence: true
  validates :earnings, numericality: { greater_than_or_equal_to: 0 }
end
