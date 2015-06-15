class ChargesController < ApplicationController
  def new

  end

def create
  @amount = params[:amount].to_i * 100

  customer = Stripe::Customer.create(
    :email => params[:email],
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'GBP'
  )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
