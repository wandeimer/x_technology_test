import 'package:flutter/material.dart';
import 'package:x_technology_test/widgets/button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Start")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Button(
              title: "Login",
              action: () {},
            ),
            Button(
              title: "Register",
              action: () {},
            ),
          ],
        ),
      ),
    );
  }
}
