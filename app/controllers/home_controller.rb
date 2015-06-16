require "stripe"

class HomeController < ApplicationController
  def index
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
    @array_of_donations = Stripe::BalanceTransaction.all["data"].map { |item| item["amount"] }
    @donation_count =Stripe::BalanceTransaction.all["data"].size
    @total_in_pounds = (@array_of_donations.reduce :+) / 100
  end

end
