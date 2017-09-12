class CartsController < ApplicationController

  before_action :set_cart, only: [:show, :checkout]

  def show
  end

  def checkout
    @cart.checkout_cart
    current_user.current_cart = nil    
    redirect_to cart_path(@cart)
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end

end

#show and checkout should use the same method to find the cart. Which method will that be?

