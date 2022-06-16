import 'dart:math';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(
    this.id,
    this.name,
    this.phone,
    this.eMail,
    this.password,
  );
  final int id;
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

  static const empty = User(0, '', '', '', '');
}
