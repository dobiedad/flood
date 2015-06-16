function stripeCheckout() {
  if ($('input[name=amount]').val() == undefined || $('input[name=amount]').val() == 0) {
    sweetAlert("Oops...", "Please enter the amount you wish to donate ", "warning");
      return false;
    }
    if ( $('input[name=amount]').val() < 1) {
      sweetAlert("Oops...", "Minimum donation is £1", "warning");
        return false;
      }

  if ($('input[name=email]').val().indexOf('@') == -1) {
  sweetAlert("Oops...", "Please enter your email ", "warning");
  return false;
}


  var form = $('#donation-form');

  var handler = StripeCheckout.configure({
    key: $('meta[name="stripe-key"]').attr('content'),
    token: function(token) {
      form.find('input[name=stripeToken]').val(token.id);
      form.find('input[name=amount]').val();
      form.submit();
    }
  });
  handler.open({
    name: 'Tamada Charity',
    description: 'Donations for floods in Georgia',
    currency: 'gbp',
    email: $('input[name=email]').val(),
    amount:$('input[name=amount]').val() * 100,
  });
}

function getBalance(){
  var balance = StripeCheckout.configure({
    key: $('meta[name="stripe-key"]').attr('content'),
    token: function(token) {
      form.find('input[name=stripeToken]').val(token.id);
      form.find('input[name=amount]').val();
      form.submit();
    }
  });
}
