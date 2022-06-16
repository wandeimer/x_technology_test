import 'package:formz/formz.dart';

enum MailValidationError { empty, invalid }

class Mail extends FormzInput<String, MailValidationError> {
  const Mail.pure() : super.pure('');
  const Mail.dirty([String value = '']) : super.dirty(value);

  @override
  MailValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : MailValidationError.empty;
  }
}
