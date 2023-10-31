import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '-config/themes/app_themes.dart';
import 'features/auth/ui/bloc/bloc.dart';
import 'features/auth/ui/views/authentication_view.dart';
import 'injection_container.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => sl()..add(InitialEvent()))
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: theme(),
          home: const AuthenticationView()),
    );
  }
}
