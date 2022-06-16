import 'package:formz/formz.dart';

enum MailValidationError { empty, invalid }

class Mail extends FormzInput<String, MailValidationError> {
  const Mail.pure() : super.pure('');
  const Mail.dirty([String value = '']) : super.dirty(value);

  @override
  MailValidationError? validator(String? value) {
    if (value?.isNotEmpty == false) {
      return MailValidationError.empty;
    } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value ?? "")) {
      return MailValidationError.invalid;
    } else {
      return null;
    }
  }
}
