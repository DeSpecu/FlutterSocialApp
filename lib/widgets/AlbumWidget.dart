import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projekt_zaliczeniowy/model/Post.dart';
import 'package:projekt_zaliczeniowy/screens/PhotosScreen.dart';
import 'package:projekt_zaliczeniowy/widgets/UserWidget.dart';
import '../main.dart';
import '../model/Album.dart';
import '../model/Photo.dart';
import '../model/User.dart';

class AlbumWidget extends StatelessWidget {
  Album album;
  Photo photo;
  User user;

  AlbumWidget({required this.album, required this.photo, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(
          onTap: () => {
              Navigator.pushNamed(context,
                "/photos"
                  )
            },
          child: Card(
            elevation: 16,
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.all(16),
                    child: UserWidget(
                      user: user,
                    )),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        album.title,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
