import 'package:formz/formz.dart';

enum LoginValidationError { empty, invalid }

class Login extends FormzInput<String, LoginValidationError> {
  const Login.pure() : super.pure('');
  const Login.dirty([String value = '']) : super.dirty(value);

  @override
  LoginValidationError? validator(String? value) {
    if (value?.isNotEmpty == false) {
      return LoginValidationError.empty;
    } else if (!(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value ?? "") ||
        RegExp(r'^(?:[+7])?[0-9]{11}$').hasMatch(value ?? ""))) {
      return LoginValidationError.invalid;
    } else {
      return null;
    }
  }
}
