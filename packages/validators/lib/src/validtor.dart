import 'package:email_validator/email_validator.dart';
import 'package:form_validator/form_validator.dart';

class Validator {
  static String? email(String? value) {
    if (value?.trim().isEmpty ?? true) return 'This field is required';
    final isValidated = EmailValidator.validate(value?.trim() ?? '');
    final result = isValidated ? null : 'Email is not valid';
    return result;
  }

  static String? password(String? value) {
    final validate = ValidationBuilder().minLength(4).build();
    final result = validate(value);
    return result;
  }

  static String? pinCode(String? value) {
    final validate = ValidationBuilder().minLength(6).build();
    final result = validate(value);
    return result;
  }

  static String? name(String? value) {
    final validate = ValidationBuilder().minLength(3).build();
    final result = validate(value);
    return result;
  }

  static String? text(String? value) {
    final validate = ValidationBuilder().minLength(1).build();
    final result = validate(value);
    return result;
  }

  static String? pic(String? value) {
    if (value == null || value.isEmpty) return null;
    final validate = ValidationBuilder().minLength(8).build();
    final result = validate(value);
    return result;
  }

  static String? postcode(String? value) {
    final validate = ValidationBuilder().minLength(4).build();
    if (value?.isNotEmpty ?? false) {
      final parseCode = int.tryParse(value!);
      if (parseCode == null) return 'Postcode must be in the format 1234';
    }
    final result = validate(value);
    return result;
  }

  static String? lpaUsername(String? value) {
    if (value == null || value.isEmpty) return 'Username is required';

    // not contains -
    if (!value.contains('-')) return 'Username is not valid';

    // contains - but pic is less than
    final split = value.split('-');
    if (split[0].length < 8) return 'Entered PIC is not valid';

    // nothing after -

    if (split[1].isEmpty) return 'Username is not valid';

    final validate = ValidationBuilder().minLength(8).build();
    final result = validate(value);
    return result;
  }

  static String? mobileNo(String? value) {
    if (value != null) {
      if (value.length < 10) return 'Mobile number needs to be of 10 digits';
    }
    final validate = ValidationBuilder().phone('Mobile is not valid').build();
    final result = validate(value);
    return result;
  }

  static String? none(String? value) => null;
}
