class User < ApplicationRecord
  has_one :seller, dependent: :destroy
  has_one :wallet, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  after_create :create_wallet

  private

  def create_wallet
    Wallet.create(user: self, balance: 50.0)
  end
end
