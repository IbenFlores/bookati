class UsersController < ApplicationController
  def profile
    authorize current_user
    @new_seller = Seller.new unless current_user.seller
    @books = current_user.seller.books if current_user.seller
  end
end
