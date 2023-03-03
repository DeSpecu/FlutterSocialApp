import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projekt_zaliczeniowy/model/Album.dart';
import 'package:projekt_zaliczeniowy/model/Photo.dart';
import 'package:projekt_zaliczeniowy/widgets/AlbumWidget.dart';

import '../model/Post.dart';
import '../model/User.dart';
import '../widgets/Drawer.dart';
import '../widgets/PostWidget.dart';

class AlbumsScreen extends StatelessWidget {
  const AlbumsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            drawer: FlutterSocialAppDrawer(),
            appBar: AppBar(
                backgroundColor: Colors.blue, title: const Text("Album")),
            body: ListView.builder(itemBuilder: (_, index) {
              return AlbumWidget(
                  user: User(1, "Josef Bratan", "jozek", "email@moje.pl"),
                  album: Album(1, 1, "Tytul Albumu"),
                  photo: Photo(1, 1, "thumbnail", "url", "Tytul Zdjecia"));
            })));
  }
}
