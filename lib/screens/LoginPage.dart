import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _MyLoginPage();
}

class _MyLoginPage extends State<LoginPage> {
  bool login = true;

  void _incrementCounter() {
    setState(() {
      login != login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: EdgeInsets.all(20),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
                child: Column(
              children: [
                if (login) const Text('Zaloguj sie'),
                if (!login) const Text('Zarejstruj sie'),
              ],
            ))
          ]),
    ));
  }
}
