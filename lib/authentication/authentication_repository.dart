import 'dart:async';

import 'package:x_technology_test/data/user.dart';
import 'package:x_technology_test/database/database.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();
  User? user;

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String login,
    required String password,
  }) async {
    UserDB _database = UserDB();
    List byPhone = await _database.loginByPhone(phone: login, pass: password);
    if (byPhone.isNotEmpty) {
      user = byPhone[0];
    } else {
      List byMail = await _database.loginByMail(email: login, pass: password);
      if (byMail.isNotEmpty) {
        user = byMail[0];
      }
    }
    if (user != null) {
      _controller.add(AuthenticationStatus.authenticated);
    }
  }

  Future<void> register({
    required String name,
    required String phone,
    required String mail,
    required String password,
  }) async {
    UserDB _database = UserDB();
    await _database.addUser(name: name, phone: phone, email: mail, pass: password);
    logIn(login: phone, password: password);
  }

  void logOut() async {
    user = null;
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void deleteUser() async {
    if (user != null) {
      UserDB _database = UserDB();
      await _database.deleteUser(id: user!.id);
      user = null;
      _controller.add(AuthenticationStatus.unauthenticated);
    }
  }

  void deleteAllUsers() async {
    if (user != null) {
      UserDB _database = UserDB();
      await _database.deleteAllUsers();
      user = null;
      _controller.add(AuthenticationStatus.unauthenticated);
    }
  }

  void dispose() => _controller.close();
}
