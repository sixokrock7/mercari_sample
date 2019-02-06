$(function() {
  Payjp.setPublicKey('pk_test_2f7bcffdaa124c05fc4a6e14');
  var form = $("charge-form"),
      number = $('input[name="number"]')[0],
      security_code = $('input[name="security_code"]')[0],
      exp_month = $('input[name="exp_month"]')[0],
      exp_year = $('input[name="exp_year"]')[0];

  $("#charge-form").on('submit', function(e) {
    e.preventDefault();
    form.find("input[type=submit]").prop("disabled", true);

    var card = {
        number: number.value,
        cvc: security_code.value,
        exp_month: exp_month.value,
        exp_year: exp_year.value
    };
    Payjp.createToken(card, function(s, response) {
      if (response.error) {
        form.find('.payment-errors').text(response.error.message);
        form.find('button').prop('disabled', false);
      }
      else {
        $(".number").removeAttr("name");
        $(".security_code").removeAttr("name");
        $(".exp_month").removeAttr("name");
        $(".exp_year").removeAttr("name");

        var token = response.id;
        $("#charge-form").append($('<input type="hidden" name="payjpToken" />').val(token));
        $("#charge-form")[0].submit();
      }
    });
  });
});
