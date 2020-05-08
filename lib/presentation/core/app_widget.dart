import "package:flutter/material.dart";

import 'package:ddd/presentation/sign_in/sign_in_page.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Notes",
      home: SignInPage(),
    );
  }
}
