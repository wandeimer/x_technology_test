import 'package:flutter/material.dart';
import 'package:x_technology_test/widgets/input_widget/input_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: const [
              InputWidget(
                title: "Phone / eMail",
                hintText: "Enter Phone or eMail",
              ),
              InputWidget(
                title: "Password",
                hintText: "Enter your password",
              ),
            ],
          )),
      bottomNavigationBar: InkWell(
        onTap: () {},
        child: Container(
          height: 86,
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.black),
          child: const Center(
            child: Text("Login",
                style: TextStyle(
                  fontFamily: 'Pretendard',
                  color: Color(0xffffffff),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  letterSpacing: -0.16,
                )),
          ),
        ),
      ),
    );
  }
}
