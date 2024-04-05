String? validateEmail(String? value) {
  final regex = RegExp(pattern);

  return value == null || value == "" || !regex.hasMatch(value)
      ? 'Enter a valid email address'
      : null;
}

String? validateLastname(String? value){
  if (value == null ||
      value == "" ||
      value.trim().length <= 2 ||
      value.trim().length > 30) {
    return "Must be between 3 and 30 characters";
  }
  return null;
}

String? validateFirstname(String? value){
  return validateLastname(value);
}

String? validatePassword(String? value){
  if (value == null ||
      value.isEmpty ||
      value.trim().length < 4) {
    return 'Please enter at least 4 characters.';
  }
  return null;
}

const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
    r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
    r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
    r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
    r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
    r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
    r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';


