part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterNameChanged extends RegisterEvent {
  const RegisterNameChanged(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}

class RegisterPhoneChanged extends RegisterEvent {
  const RegisterPhoneChanged(this.phone);

  final String phone;

  @override
  List<Object> get props => [phone];
}

class RegisterMailChanged extends RegisterEvent {
  const RegisterMailChanged(this.mail);

  final String mail;

  @override
  List<Object> get props => [mail];
}

class RegisterPasswordChanged extends RegisterEvent {
  const RegisterPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class RegisterSubmitted extends RegisterEvent {
  const RegisterSubmitted();
}
