import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projekt_zaliczeniowy/screens/LoginPage.dart';
import 'package:projekt_zaliczeniowy/screens/PhotosScreen.dart';
import 'package:projekt_zaliczeniowy/screens/PostsScreen.dart';
import '../model/Post.dart';
import 'firebase_options.dart';

Color randomColor() {
  var generatedColor = Random().nextInt(Colors.primaries.length);
  return Colors.primaries[generatedColor];
}

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    routes: {
      "/": (context) => const LoginPage(),
      "/posts": (context) => PostsScreen(),
      "/photos" : (context) => const PhotoScreen(),
      "/album" : (context) => const PhotoScreen()
    },
  ));
}


