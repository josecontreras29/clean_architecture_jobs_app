import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/ok_button_dialog.dart';
import '../bloc/bloc.dart';
import '../reusable_widgets/background_login.dart';

class ForgottenPasswordView extends StatefulWidget {
  const ForgottenPasswordView({super.key});

  @override
  State<ForgottenPasswordView> createState() => _ForgottenPasswordViewState();
}

class _ForgottenPasswordViewState extends State<ForgottenPasswordView> {
  final controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: BackgroundLogin(
        child: Center(
          child: Column(
            children: [
              const Text(
                  "Enter your email address below and we'll send your password reset instructions by email.",
                  textAlign: TextAlign.center),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(fontSize: 14),
                    controller: controllerEmail,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(color: Colors.blue[700]!, width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                const BorderSide(color: Colors.blue, width: 2)),
                        suffixIconColor: Colors.grey,
                        isDense: true,
                        border: InputBorder.none,
                        labelText: "Email"),
                  )),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () async {
                      context.read<AuthBloc>().add(InitialEventAuth());
                      await okButton(context, "Email sent");
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Reset password',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    const Text("Remember password?  ",
                        textAlign: TextAlign.center),
                    RichText(
                      text: TextSpan(
                          text: "Sign in",
                          style: TextStyle(
                              color: Colors.blue[700]!,
                              fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () =>
                                context.read<AuthBloc>().add(InitialEventAuth())),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
