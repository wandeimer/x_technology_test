import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:x_technology_test/authentication/authentication_repository.dart';
import 'package:x_technology_test/navigation/bloc/navigation_bloc.dart';
import 'package:x_technology_test/register_screen/bloc/register_bloc.dart';
import 'package:x_technology_test/widgets/input_widget/input_widget.dart';

class RegisterScreen extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => RegisterScreen());
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
                    return RegisterBloc(
                      authenticationRepository: RepositoryProvider.of<AuthenticationRepository>(context),
                    );
                  },
                  child: Scaffold(
                      appBar: AppBar(
                        title: const Text("Register"),
                      ),
                      body: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              BlocBuilder<RegisterBloc, RegisterState>(
                                  buildWhen: (previous, current) => previous.name != current.name,
                                  builder: (context, state) {
                                    return InputWidget(
                                      title: "Name",
                                      hintText: "Ivan",
                                      onChanged: (name) => context.read<RegisterBloc>().add(RegisterNameChanged(name)),
                                      errorText: state.name.invalid ? 'invalid name' : null,
                                    );
                                  }),
                              BlocBuilder<RegisterBloc, RegisterState>(
                                  buildWhen: (previous, current) => previous.phone != current.phone,
                                  builder: (context, state) {
                                    return InputWidget(
                                      title: "Phone",
                                      hintText: "8-800-555-35-35",
                                      onChanged: (phone) =>
                                          context.read<RegisterBloc>().add(RegisterPhoneChanged(phone)),
                                      errorText: state.phone.invalid ? 'invalid phone' : null,
                                    );
                                  }),
                              BlocBuilder<RegisterBloc, RegisterState>(
                                  buildWhen: (previous, current) => previous.mail != current.mail,
                                  builder: (context, state) {
                                    return InputWidget(
                                      title: "eMail",
                                      hintText: "ivan@gmail.com",
                                      onChanged: (mail) => context.read<RegisterBloc>().add(RegisterMailChanged(mail)),
                                      errorText: state.mail.invalid ? 'invalid mail' : null,
                                    );
                                  }),
                              BlocBuilder<RegisterBloc, RegisterState>(
                                  buildWhen: (previous, current) => previous.password != current.password,
                                  builder: (context, state) {
                                    return InputWidget(
                                      title: "Password",
                                      hintText: "Enter your password",
                                      onChanged: (password) =>
                                          context.read<RegisterBloc>().add(RegisterPasswordChanged(password)),
                                      errorText: state.password.invalid ? 'invalid password' : null,
                                    );
                                  }),
                            ],
                          )),
                      bottomNavigationBar: BlocBuilder<RegisterBloc, RegisterState>(
                          buildWhen: (previous, current) => previous.status != current.status,
                          builder: (context, state) {
                            return state.status.isSubmissionInProgress
                                ? const CircularProgressIndicator()
                                : InkWell(
                                    onTap: state.status.isValidated
                                        ? () {
                                            context.read<RegisterBloc>().add(const RegisterSubmitted());
                                          }
                                        : null,
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
                                  );
                          }))));
        });
  }
}
