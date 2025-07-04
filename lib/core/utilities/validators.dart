bool validateEmail(String value) => RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}"
      r"[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$",
    ).hasMatch(value);

bool validateNotEmpty(String value) => value.trim().isNotEmpty;

bool validatePhoneNumber(String value) {
  final regex = RegExp(
    r'^\+?1?\d{10,15}$|^\(\d{3}\)\s\d{3}-\d{4}$|^\d{3}-\d{3}-\d{4}$',
  );
  return regex.hasMatch(value);
}

bool validateZipCode(String value) {
  final regex = RegExp(r'^\d{5}(-\d{4})?$');
  return regex.hasMatch(value);
}

bool validateCode(String value) => RegExp(r'^\d{5}$').hasMatch(value);
