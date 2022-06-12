import 'package:flutter/material.dart';
import 'package:x_technology_test/home_screen/widgets/user_info_field.dart';
import 'package:x_technology_test/widgets/button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: ListView(
        padding: const EdgeInsets.only(top: 40),
        children: [
          const UserInfoField(
            label: "Name",
            data: "Ivan",
          ),
          const UserInfoField(
            label: "Phone",
            data: "88005553535",
          ),
          const UserInfoField(
            label: "Email",
            data: "mail@mail.ru",
          ),
          Button(
            title: "LogOut",
            action: () {},
          ),
          Button(
            title: "LogOut and delete account",
            action: () {},
          ),
          Button(
            title: "Delete all accounts",
            action: () {},
          ),
        ],
      ),
    );
  }
}
