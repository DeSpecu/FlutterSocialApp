import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projekt_zaliczeniowy/widgets/UserWidget.dart';
import '../model/Album.dart';
import '../model/User.dart';
import 'package:projekt_zaliczeniowy/screens/PhotosScreen.dart';

class AlbumWidget extends StatelessWidget {
  Album album;

  AlbumWidget({required this.album});

  @override
  Widget build(BuildContext context) {
    return Container(
       child: InkWell(
         onTap: ()  {
           Navigator.pushNamed(context,
               "/photos",
               arguments: {
               'title': album.title,
               'albumId': album.id,
               }
           );
         },
         child: Card(
           elevation: 16,
           child: Column(
             children: [
               Padding(
                   padding: EdgeInsets.all(16),
                   child: UserWidget(
                       user: User.fetchUser(album.userId)
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
       )
    );
  }
}

