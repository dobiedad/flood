require "stripe"

class HomeController < ApplicationController
  def index
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
    @array_of_donations = Stripe::BalanceTransaction.all["data"].select{ |item| item["type"] == "charge" }.map { |item| item["amount"] }
    @donation_count = @array_of_donations.size
    @total_in_pounds = (@array_of_donations.sum) / 100

  end

end
