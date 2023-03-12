import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'PostsScreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _MyLoginPage();
}

class _MyLoginPage extends State<LoginPage> {
  bool isMember = true;
  final email = TextEditingController();
  final password = TextEditingController();


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    email.dispose();
    password.dispose();
    super.dispose();
  }

  void _changeType() {
    setState(() {
      isMember = !isMember;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
                child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: email,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Enter valid mail id as abc@gmail.com'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: password,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter your secure password'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: FilledButton(
                    child: isMember
                        ? const Text("Zaloguj sie")
                        : const Text("Zarejestruj sie"),
                    onPressed: () async {
                      if (isMember) {
                        try {
                          final credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: email.text, password: password.text);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PostsScreen()));
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            print('No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            print('Wrong password provided for that user.');
                          }
                        }
                      } else {
                        try {
                          final credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: email.text,
                            password: password.text,
                          );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PostsScreen()));
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print('The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            print('The account already exists for that email.');
                          }
                        } catch (e) {
                          print(e);
                        }
                      }
                    },
                  ),
                ),
                if (isMember)
                  (Padding(
                    padding: EdgeInsets.all(30),
                    child: OutlinedButton(
                      child: Text("Nie masz konta Zarejstruj sie"),
                      onPressed: () {
                        _changeType();
                      },
                    ),
                  ))
                else
                  (Padding(
                    padding: EdgeInsets.all(30),
                    child: OutlinedButton(
                      child: Text("Masz konto zaloguj sie"),
                      onPressed: () {
                        _changeType();
                      },
                    ),
                  )),
              ],
            ))
          ]),
    );
  }
}
