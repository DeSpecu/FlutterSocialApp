import 'package:flutter/material.dart';
import 'package:projekt_zaliczeniowy/widgets/PhotoWidget.dart';

import '../model/Album.dart';
import '../model/Photo.dart';

class PhotoScreen extends StatelessWidget {
  const PhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Photos'),
        ),
        body: ListView.builder(itemBuilder: (_, index) {
          return Column(
            children: [
              PhotoWidget(
                  album: Album(1, 1, "Tytul Albumu"),
                  photo: Photo(1, 1, "thumbnail", "url", "Tytul Zdjecia"))
            ],
          );
        })
    );
  }
}
