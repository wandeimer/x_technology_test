import 'dart:math';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(
    this.name,
    this.phone,
    this.eMail,
    this.password,
  );

  final String name;
  final String phone;
  final String eMail;
  final String password;

  @override
  List<Object> get props => [
        name,
        phone,
        eMail,
      ];

  static const empty = User('', '', '', '');
}
