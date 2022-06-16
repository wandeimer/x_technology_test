import 'package:formz/formz.dart';

enum LoginValidationError { empty }

class Login extends FormzInput<String, LoginValidationError> {
  const Login.pure() : super.pure('');
  const Login.dirty([String value = '']) : super.dirty(value);

  @override
  LoginValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : LoginValidationError.empty;
  }
}
