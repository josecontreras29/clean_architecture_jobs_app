import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/registration_data_form.dart';
import '../bloc/bloc.dart';
import '../reusable_widgets/background_login.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  TextEditingController controllerNombre = TextEditingController();
  TextEditingController controllerApellido = TextEditingController();
  TextEditingController controllerCorreo = TextEditingController();
  TextEditingController controllerCelular = TextEditingController();
  TextEditingController controllerDireccion = TextEditingController();
  late AuthBloc authBloc = context.read<AuthBloc>();
  final _formField = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: BackgroundLogin(
          child: Form(
        key: _formField,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Text("Registration form",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[700]!)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(labelText: "Nombre"),
              style: const TextStyle(fontSize: 14),
              controller: controllerNombre,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter a value";
                }
                return null;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(labelText: "Apellido"),
              style: const TextStyle(fontSize: 14),
              controller: controllerApellido,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter a value";
                }
                return null;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: "Correo"),
              style: const TextStyle(fontSize: 14),
              controller: controllerCorreo,
              validator: (value) {
                if (value!.isEmpty ||
                    !value.contains("@") ||
                    !value.contains(".")) {
                  return "Please enter a valid email";
                }
                return null;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(labelText: "Celular"),
              style: const TextStyle(fontSize: 14),
              controller: controllerCelular,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'^\+?\d*'))
              ],
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter a value";
                }
                return null;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.streetAddress,
              decoration: const InputDecoration(labelText: "Direccion"),
              style: const TextStyle(fontSize: 14),
              controller: controllerDireccion,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter a value";
                }
                return null;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
              onPressed: () async {
                if (_formField.currentState!.validate()) {
                  authBloc.add(SignUp(
                      registrationData: RegistrationDataForm(
                          nombre: controllerNombre.text,
                          apellido: controllerApellido.text,
                          correo: controllerCorreo.text,
                          celular: int.parse(controllerCelular.text),
                          direccion: controllerDireccion.text)));
                }
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Create",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                const Text("Already have an user?  ",
                    textAlign: TextAlign.center),
                RichText(
                  text: TextSpan(
                      text: "Login",
                      style: TextStyle(
                          color: Colors.blue[700]!,
                          fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => authBloc.add(InitialEventAuth())),
                )
              ],
            ),
          )
        ]),
      )),
    );
  }
}
