import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: const SingleChildScrollView(
            child: Column(children: [Center(child: Text("Logged"))])));

    // Scaffold(
    //   body: SafeArea(
    //     child: Center(
    //       child: ,
    //     ),
    //   ),
    // );
  }
}
