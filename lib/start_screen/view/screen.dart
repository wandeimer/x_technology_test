import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_technology_test/authentication/authentication_repository.dart';
import 'package:x_technology_test/authentication/bloc/authentication_bloc.dart';
import 'package:x_technology_test/navigation/bloc/navigation_bloc.dart';
import 'package:x_technology_test/widgets/button.dart';

class StartScreen extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => StartScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Start")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<NavigationBloc, NavigationState>(
              buildWhen: (previous, current) => previous.status != current.status,
              builder: (context, state) {
                return Button(
                  title: "Login",
                  action: () {
                    context.read<NavigationBloc>().add(const NavigationStatusChanged(
                          NavigationStatus.login,
                        ));
                  },
                );
              },
            ),
            BlocBuilder<AuthenticationBloc, AuthenticationState>(
              buildWhen: (previous, current) => previous.status != current.status,
              builder: (context, state) {
                return Button(
                  title: "Register",
                  action: () {
                    context.read<NavigationBloc>().add(const NavigationStatusChanged(
                          NavigationStatus.registering,
                        ));
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
