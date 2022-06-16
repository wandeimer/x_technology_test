import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_technology_test/authentication/bloc/authentication_bloc.dart';
import 'package:x_technology_test/home_screen/view/widgets/user_info_field.dart';
import 'package:x_technology_test/widgets/button.dart';

class HomeScreen extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Home")),
        body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            buildWhen: (previous, current) => previous.status != current.status,
            builder: (context, state) {
              return ListView(
                padding: const EdgeInsets.only(top: 40),
                children: [
                  UserInfoField(
                    label: "Name",
                    data: state.user.name,
                  ),
                  UserInfoField(
                    label: "Phone",
                    data: state.user.phone,
                  ),
                  UserInfoField(
                    label: "Email",
                    data: state.user.eMail,
                  ),
                  Button(
                    title: "LogOut",
                    action: () {
                      context.read<AuthenticationBloc>().add(AuthenticationLogoutRequested());
                    },
                  ),
                  Button(
                    title: "LogOut and delete account",
                    action: () {
                      context.read<AuthenticationBloc>().add(AuthenticationDeleteAccountRequested());
                    },
                  ),
                  Button(
                    title: "Delete all accounts",
                    action: () {
                      context.read<AuthenticationBloc>().add(AuthenticationDeleteAllAccountsRequested());
                    },
                  ),
                ],
              );
            }));
  }
}
