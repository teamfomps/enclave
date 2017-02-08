jQuery(function() {
  'use strict';
  var $passwordField = $('#member_password');

  if ($passwordField.length > 0) {
    var $passwordConfirmationGroup = $('#password-confirmation-group');

    if ($passwordField.val().length == 0) {
      $passwordConfirmationGroup.hide();
    }

    $('#member_password').keyup(function() {
      if ($passwordField.val().length > 0) {
        $passwordConfirmationGroup.show();
        $(this).unbind('keyup');
      }
    });
  }
});
