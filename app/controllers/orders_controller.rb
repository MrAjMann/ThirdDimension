class OrdersController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    # @book = Book.find(params[:book_id])

    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'], 
      success_url: order_success_url,
      cancel_url: order_cancel_url,
      line_items: [
        { 
          name: @product.name, 
          description: "by #{@product.user.first_name}",
          amount: (@product.price * 100).to_i,
          currency: "aud",
          quantity: 1
         }
      ]
    )
  end

  def success
    render html: "<h4>Thanks for your order</h4>".html_safe
    # render json: params
  end

  def cancel
    render html: "<h4>The order has been canceled</h4>".html_safe
  end
end
