import 'package:flutter/material.dart';
import 'package:x_technology_test/widgets/input_widget/input_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: const [
              InputWidget(
                title: "Name",
                hintText: "Ivan",
              ),
              InputWidget(
                title: "Phone",
                hintText: "8-800-555-35-35",
              ),
              InputWidget(
                title: "eMail",
                hintText: "ivan@gmail.com",
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
            child: Text("Register",
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
