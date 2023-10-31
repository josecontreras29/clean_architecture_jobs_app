import 'package:flutter/material.dart';

Future<dynamic> okButton(BuildContext context, String title) {
  return showDialog(
      context: context,
      builder: (context) => Dialog(
              child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.blue[700],
                      borderRadius: BorderRadius.circular(5)),
                  child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Accept")),
                )
              ],
            ),
          )));
}
