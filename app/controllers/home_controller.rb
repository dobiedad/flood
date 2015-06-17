require "stripe"

class HomeController < ApplicationController
  def index
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
    @array_of_donations = fetch_all_transactions_after(nil).map { |item| item["amount"]}
    @donation_count = @array_of_donations.size
    @total_in_pounds = (@array_of_donations.sum) / 100
  end

  def fetch_all_transactions_after(t)
    page = Stripe::BalanceTransaction.all(limit: 100, starting_after: t)["data"].select{ |item| item["type"] == "charge" }
    if page.last.nil?
      []
    else
      page + fetch_all_transactions_after(page.last)
    end
  end
end
