class Validator {
  Validator._();
  static String? checkIsEmpty(value) {
    if (value.isEmpty || value == '') {
      return 'Cannot be empty!';
    }
    return null;
  }

  static String? checkEmail(value) {
    bool emailIsValid =
        RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*(\.[a-z]{2,4})$')
            .hasMatch(value!);
    if (value.isEmpty || value == '') {
      return 'Cannot be empty!';
    }
    if (!emailIsValid) {
      return 'Email is invalid!';
    }
    return null;
  }

  static String? checkPassword(value) {
    if (value.isEmpty || value == '') {
      return 'Cannot be empty!';
    }
    if (value.toString().length < 8) {
      return 'The password must be more than 8 characters!';
    }
    if (!RegExp(r'[A-Za-z]').hasMatch(value) ||
        !RegExp(r'[0-9]').hasMatch(value)) {
      return 'The password must contain letters and numbers!';
    }
    return null;
  }

  static String? confirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Confirm password cannot be empty!';
    }
    if (value != password) {
      return 'Confirm password does not match!';
    }
    return null;
  }

  static String? checkPhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number cannot be empty!';
    }
    bool phoneNumberIsValid = RegExp(r'^[0-9]{10,11}$').hasMatch(value);
    if (!phoneNumberIsValid) {
      return 'Invalid phone number!';
    }
    return null;
  }

  static String? checkNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Number cannot be empty!';
    }
    bool numberIsValid = RegExp(r'^[0-9]+$').hasMatch(value);
    if (!numberIsValid) {
      return 'Invalid number!';
    }
    return null;
  }
}
