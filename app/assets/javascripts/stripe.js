function stripeCheckout() {
  if ($('input[name=amount]').val() == undefined || $('input[name=amount]').val() == 0) {
    sweetAlert("Oops...", "Please enter the amount you wish to donate ", "warning");
      return false;
    }
    if (!validateEmail($('input[name=email]').val())) {
      sweetAlert("Oops...", "Please enter a valid email", "warning");
        return false;
      }
      if ( $('select[name=charity_type]').val() < 1) {
        sweetAlert("Oops...", "Please select which charity you wish to donate to", "warning");
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
    name: 'BGS Charity Fund',
    description: 'Donations for children in Georgia',
    currency: 'gbp',
    email: $('input[name=email]').val(),
    amount:$('input[name=amount]').val() * 100,
  });
}

function validateEmail(email) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
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
