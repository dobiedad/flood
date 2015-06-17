require "stripe"

class HomeController < ApplicationController
  def index
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
    @array_of_donations = Stripe::BalanceTransaction.all(:limit => 100)["data"].select{ |item| item["type"] == "charge" }.map { |item| item["amount"] }
    @donation_count = @array_of_donations.size
    @total_in_pounds = (@array_of_donations.sum) / 100
    # if @donation_count = 100
    #   @starting_after=@array_of_donations.last
    #   @array_of_donations = Stripe::BalanceTransaction.all(:limit => 100)["data"].select{ |item| item["type"] == "charge" }.map { |item| item["amount"] }
    # end
  end
end
