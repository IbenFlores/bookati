class UsersController < ApplicationController
  def profile
    @new_seller = Seller.new unless current_user.seller
  end
end
