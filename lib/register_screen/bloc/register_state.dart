part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.status = FormzStatus.pure,
    this.name = const Name.pure(),
    this.phone = const Phone.pure(),
    this.mail = const Mail.pure(),
    this.password = const Password.pure(),
  });

  final FormzStatus status;
  final Name name;
  final Phone phone;
  final Mail mail;
  final Password password;

  RegisterState copyWith({
    FormzStatus? status,
    Name? name,
    Phone? phone,
    Mail? mail,
    Password? password,
  }) {
    return RegisterState(
      status: status ?? this.status,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      mail: mail ?? this.mail,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [status, name, phone, mail, password];
}
