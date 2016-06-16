class DonationNotifier < ActionMailer::Base
  default :from => 'charity@bgsfund.co.uk'

  def donation_confirmation(email: email,amount: amount,charity_type:charity_type)
    @home = "info@britishgeorgiansociety.org"
    @email = email
    @amount = amount;
    @charity_type = charity_type
    mail( :to => @email,:bcc => @email,
    :subject => 'Thank you for your donation!' )
  end
end
