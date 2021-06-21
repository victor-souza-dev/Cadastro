import 'package:flutter/material.dart';
import 'package:sqlite/screens/registers/form_register.dart';

void main() {
  runApp(MaterialApp(
    title: "Previsão do tempo",
    routes: {
      "/": (BuildContext context) => FormRegister(),
    },
    initialRoute: "/",
    theme: ThemeData(
      primarySwatch: Colors.deepPurple,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(),
      ),
    ),
  ));
}
