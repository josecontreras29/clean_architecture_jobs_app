import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../-config/constants/images.dart';
import '../bloc/bloc.dart';
import '../reusable_widgets/background_login.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final controllerUser = TextEditingController();
  final controllerpw = TextEditingController();
  final _formField = GlobalKey<FormState>();
  bool _pwVisibility = false;

  late AuthBloc authBloc;

  @override
  void initState() {
    authBloc = context.read<AuthBloc>();
    authBloc.add(InitialEvent());
    super.initState();
  }

  @override
  void dispose() {
    controllerUser.dispose();
    controllerpw.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: BackgroundLogin(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            // ICONO
            SizedBox(width: 150, child: Image.asset(ImagesLogin.iconLogin)),
            // SizedBox(
            //     width: 150,
            //     child: Text("Joffert",
            //         textAlign: TextAlign.center,
            //         style: TextStyle(
            //             color: Colors.blue[900]!,
            //             fontSize: 36,
            //             fontWeight: FontWeight.bold))),

            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Form(
                key: _formField,
                child: Column(
                  children: [
                    // TEXTFIELD EMAIL
                    Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: const TextStyle(fontSize: 14),
                          controller: controllerUser,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      color: Colors.blue[700]!, width: 2)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 2)),
                              suffixIconColor: Colors.grey,
                              isDense: true,
                              border: InputBorder.none,
                              labelText: "Email"),
                          validator: (value) {
                            if (value!.isEmpty ||
                                !value.contains("@") ||
                                !value.contains(".")) {
                              return "Please enter a valid email";
                            }
                            return null;
                          },
                        )),
                    // TEXTFIELD PASSWORD
                    Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(fontSize: 14),
                          controller: controllerpw,
                          obscureText: !_pwVisibility,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                              labelText: "Password",
                              suffixIcon: InkWell(
                                  onTap: () {
                                    _pwVisibility = !_pwVisibility;
                                    setState(() {});
                                  },
                                  child: Icon(
                                      _pwVisibility
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      size: 22))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter a valid password";
                            }
                            return null;
                          },
                        )),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  // BUTTON LOGIN
                  ElevatedButton(
                    onPressed: () {
                      if (_formField.currentState!.validate()) {
                        authBloc.add(SignIn(
                            user: controllerUser.text,
                            password: controllerpw.text));
                      }
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                            child: Text('Login',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 15, bottom: 15),
                      child: const Row(children: [
                        Expanded(child: Divider(color: Colors.grey)),
                        Text("  or  "),
                        Expanded(child: Divider(color: Colors.grey))
                      ])),
                  // BUTTON REGISTER
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                    onPressed: () => authBloc.add(RegisterEvent()),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Register',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 20),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: "Forgotten password?",
                        style: TextStyle(
                            color: Colors.blue[700]!,
                            fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap =
                              () => authBloc.add(ForgottenPaswordEvent()))))
          ])),
    );
  }
}
