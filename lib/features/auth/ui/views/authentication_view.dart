import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../-config/constants/images.dart';
import '../../../../widgets/ok_button_dialog.dart';
import '../../../home/ui/views/home_view.dart';

import '../bloc/bloc.dart';
import 'views.dart';

class AuthenticationView extends StatefulWidget {
  const AuthenticationView({super.key});

  @override
  State<AuthenticationView> createState() => _AuthenticationViewState();
}

class _AuthenticationViewState extends State<AuthenticationView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(ImagesLogin.backgroundLogin))),
                child: Center(
                    child: SingleChildScrollView(
                        child: BlocConsumer<AuthBloc, AuthState>(
                            listener: (context, state) async {
                  if (state is UserRegistered) {
                    return await okButton(context, "User created");
                  }
                  if (state is UserNotRegistered) {
                    return await okButton(context, "User not created");
                  }
                  if (state is AuthDenied) {
                    return await okButton(context, "Incorrect credentials");
                  }
                }, builder: (context, state) {
                  if (state is LoginInitial) {
                    return const LoginView();
                  } else if (state is RegisterInitial) {
                    return const RegistrationView();
                  } else if (state is ForgottenPasswordInitial) {
                    return const ForgottenPasswordView();
                  } else if (state is Loading) {
                    return const Center(
                        child: CircularProgressIndicator(
                            color: Colors.black, strokeWidth: 6));
                  } else if (state is UserRegistered) {
                    return const LoginView();
                  } else if (state is AuthPassed) {
                    return const HomeView();
                  } else {
                    return const SizedBox();
                  }
                }))))));
  }
}
