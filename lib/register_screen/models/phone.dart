import 'package:formz/formz.dart';

enum PhoneValidationError { empty, invalid }

class Phone extends FormzInput<String, PhoneValidationError> {
  const Phone.pure() : super.pure('');
  const Phone.dirty([String value = '']) : super.dirty(value);

  @override
  PhoneValidationError? validator(String? value) {
    if (value?.isNotEmpty == false) {
      return PhoneValidationError.empty;
    } else if (!RegExp(r'^(?:[+7])?[0-9]{11}$').hasMatch(value ?? "")) {
      return PhoneValidationError.invalid;
    } else {
      return null;
    }
  }
}
