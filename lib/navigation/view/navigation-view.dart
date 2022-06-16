import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_technology_test/login_screen/view/screen.dart';
import 'package:x_technology_test/navigation/bloc/navigation_bloc.dart';
import 'package:x_technology_test/register_screen/view/screen.dart';
import 'package:x_technology_test/splash/view/splash_page.dart';
import 'package:x_technology_test/start_screen/view/screen.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({
    Key? key,
  }) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const NavigationScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationBloc(),
      child: AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<NavigationBloc, NavigationState>(
          listener: (context, state) {
            switch (state.status) {
              case NavigationStatus.start:
                _navigator.pushAndRemoveUntil<void>(
                  StartScreen.route(),
                  (route) => false,
                );
                break;
              case NavigationStatus.login:
                _navigator.push<void>(LoginScreen.route());
                break;
              case NavigationStatus.registering:
                _navigator.push<void>(RegisterScreen.route());
                break;

              default:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => StartScreen.route(),
    );
  }
}
