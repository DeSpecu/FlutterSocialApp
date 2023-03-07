import 'dart:math';
import 'package:flutter/material.dart';
import 'package:projekt_zaliczeniowy/screens/PhotosScreen.dart';
import 'package:projekt_zaliczeniowy/screens/PostsScreen.dart';
import '../model/Post.dart';

Color randomColor() {
  var generatedColor = Random().nextInt(Colors.primaries.length);
  return Colors.primaries[generatedColor];
}

void main() {
  runApp(MaterialApp(
    routes: {
      "/": (context) => PostsScreen(),
      "/photos" : (context) => const PhotoScreen(),
      "/album" : (context) => const PhotoScreen()
    },
  ));
}


