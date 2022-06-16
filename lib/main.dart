import 'package:flutter/material.dart';
import 'package:x_technology_test/app.dart';
import 'package:x_technology_test/authentication/authentication_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: App(
        authenticationRepository: AuthenticationRepository(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
