import 'package:formz/formz.dart';

enum PasswordValidationError { empty, invalid }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordValidationError? validator(String? value) {
    if (value?.isNotEmpty == false) {
      return PasswordValidationError.empty;
    } else if (!RegExp(r"^(?=.*?[a-zA-Z])(?=.*?[0-9]).{8,}$").hasMatch(value ?? "")) {
      return PasswordValidationError.invalid;
    } else {
      return null;
    }
  }
}
