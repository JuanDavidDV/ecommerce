class BuyNowController < ApplicationController
  before_action :set_product
  def show
  end

  def create
    session = Stripe::Checkout::Session.create({
    ui_mode: 'embedded',
    line_items: [{
      # Provide the exact Price ID (e.g. pr_1234) of the product you want to sell
        price_data: {
          currency: "cad",
          unit_amount: (@product.price * 100).to_i,    #Stripe does not use decimals, thefore this will be multipled by 100 and converted to intiger
          product_data: {
            name: @product.name
          },
        },
        quantity: 1,
      }],
      shipping_address_collection: {
        allowed_countries: STRIPE_SUPPORTED_COUNTRIES
      },
      mode: 'payment',
      return_url: success_product_buy_now_url(@product),    #This where the user will be redirected after paying
    })

    render json: { clientSecret: session.client_secret }
  end

  def success
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end
end