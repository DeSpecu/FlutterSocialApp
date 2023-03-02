import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:projekt_zaliczeniowy/Widgets/PostVisual.dart';

Color randomColor() {
  var generatedColor = Random().nextInt(Colors.primaries.length);
  return Colors.primaries[generatedColor];
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar:
                AppBar(backgroundColor: Colors.blue, title: const Text("Tak")),
            body: ListView.builder(itemBuilder: (_, index) {
              return PostVisual();
            }
            )
        )
    );
  }
}
