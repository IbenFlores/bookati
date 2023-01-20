class SellersController < ApplicationController
  def create
    @new_seller = Seller.new(seller_params)
    @new_seller.user = current_user
    if @new_seller.save
      redirect_to profile_path
    else
      render "users/profile", status: :unprocessable_entity
    end
  end

  private

  def seller_params
    params.require(:seller).permit(:phone_number)
  end
end
