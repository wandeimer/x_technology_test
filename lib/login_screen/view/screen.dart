import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:x_technology_test/authentication/authentication_repository.dart';
import 'package:x_technology_test/authentication/bloc/authentication_bloc.dart';
import 'package:x_technology_test/login_screen/bloc/login_bloc.dart';
import 'package:x_technology_test/login_screen/models/login.dart';
import 'package:x_technology_test/login_screen/models/password.dart';
import 'package:x_technology_test/navigation/bloc/navigation_bloc.dart';
import 'package:x_technology_test/widgets/input_widget/input_widget.dart';

class LoginScreen extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return WillPopScope(
              onWillPop: () async {
                context.read<NavigationBloc>().add(const NavigationStatusChanged(
                      NavigationStatus.start,
                    ));
                return false;
              },
              child: BlocProvider(
                create: (context) {
                  return LoginBloc(
                    authenticationRepository: RepositoryProvider.of<AuthenticationRepository>(context),
                  );
                },
                child: Scaffold(
                    appBar: AppBar(
                      title: const Text("Login"),
                    ),
                    body: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            BlocBuilder<LoginBloc, LoginState>(
                                buildWhen: (previous, current) => previous.login != current.login,
                                builder: (context, state) {
                                  return InputWidget(
                                    title: "Phone / eMail",
                                    hintText: "Enter Phone or eMail",
                                    onChanged: (login) => context.read<LoginBloc>().add(LoginUsernameChanged(login)),
                                    errorText: state.login.pure
                                        ? null
                                        : state.login.error == LoginValidationError.empty
                                            ? 'empty login'
                                            : state.login.error == LoginValidationError.invalid
                                                ? 'invalid login'
                                                : null,
                                  );
                                }),
                            BlocBuilder<LoginBloc, LoginState>(
                                buildWhen: (previous, current) => previous.password != current.password,
                                builder: (context, state) {
                                  return InputWidget(
                                    title: "Password",
                                    hintText: "Enter your password",
                                    obscureText: true,
                                    onChanged: (password) =>
                                        context.read<LoginBloc>().add(LoginPasswordChanged(password)),
                                    errorText: state.password.pure
                                        ? null
                                        : state.password.error == PasswordValidationError.empty
                                            ? 'empty password'
                                            : state.password.error == PasswordValidationError.invalid
                                                ? 'invalid password'
                                                : null,
                                  );
                                }),
                          ],
                        )),
                    bottomNavigationBar: BlocBuilder<LoginBloc, LoginState>(
                        buildWhen: (previous, current) => previous.status != current.status,
                        builder: (context, state) {
                          return state.status.isSubmissionInProgress
                              ? const CircularProgressIndicator()
                              : InkWell(
                                  onTap: state.status.isValidated
                                      ? () {
                                          context.read<LoginBloc>().add(const LoginSubmitted());
                                        }
                                      : null,
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
                                );
                        })),
              ));
        });
  }
}
