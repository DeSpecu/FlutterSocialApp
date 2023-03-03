import 'dart:math';
import 'package:flutter/material.dart';
import 'package:projekt_zaliczeniowy/screens/PostsScreen.dart';
import 'dart:io';

import 'package:projekt_zaliczeniowy/widgets/PostVisual.dart';
import 'package:projekt_zaliczeniowy/widgets/PostWidget.dart';
import 'package:projekt_zaliczeniowy/model/Post.dart';
import 'package:projekt_zaliczeniowy/model/User.dart';
import 'package:projekt_zaliczeniowy/widgets/Drawer.dart';

Color randomColor() {
  var generatedColor = Random().nextInt(Colors.primaries.length);
  return Colors.primaries[generatedColor];
}

void main() {
  runApp(const MaterialApp(
    home: PostsScreen()
  ));
}


