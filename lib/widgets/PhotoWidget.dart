import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projekt_zaliczeniowy/model/Post.dart';
import 'package:projekt_zaliczeniowy/widgets/UserWidget.dart';
import '../main.dart';
import '../model/Album.dart';
import '../model/Photo.dart';
import '../model/User.dart';

class PhotoWidget extends StatelessWidget {
  Album album;
  Photo photo;


  PhotoWidget({required this.album, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: InkWell(
          splashColor: Colors.grey,
          onTap: (){},
          child: Column(
            children: [
              //Image.asset('assets/images/imageplaceholder.png')
            ],
          )
        ));
  }
}
