import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/Album.dart';
import '../model/Photo.dart';

class PhotoWidget extends StatelessWidget {
  Photo photo;

  PhotoWidget({required this.photo});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: EdgeInsets.all(16),
      child: Card(
        elevation: 16,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SelectableText(
              photo.title,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Image.network(photo.url)
          ],
        ),
      ),
    ));
  }
}
