/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'package:conreality_login/conreality_login.dart';

////////////////////////////////////////////////////////////////////////////////

class LoginScreen extends StatefulWidget {
  static const route = "/widgets/login";

  LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginState();
}

////////////////////////////////////////////////////////////////////////////////

class _LoginState extends State<LoginScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        actions: <Widget>[
        ].where((element) => element != null).toList(),
      ),
      body: Center(child: Container()), // TODO
    );
  }
}
