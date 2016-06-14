class DonationNotifier < ActionMailer::Base
  default :from => 'charity@bgsfund.co.uk'

  def donation_confirmation(email: email,amount: amount)
    @email = email
    @amount = amount;
    mail( :to => @email,
    :subject => 'Thank you for your donation!' )
  end
end
