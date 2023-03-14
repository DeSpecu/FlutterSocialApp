import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projekt_zaliczeniowy/widgets/UserWidget.dart';

import '../model/Album.dart';
import '../model/Photo.dart';
import '../model/Post.dart';
import '../model/User.dart';

class AlbumWidget extends StatelessWidget {
  Album album;
  Post post;

  AlbumWidget({required this.album, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(
          onTap: () => {
              Navigator.pushNamed(context,
                "/photos"
                  )
            },
          child: FutureBuilder(future: post.user,
            builder: (context, snapshot){
              if(snapshot.hasData){
                Card(
                  elevation: 16,
                  child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.all(16),
                          child: UserWidget(
                              post: Post(0, 1, "title", "body", post.user)
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
                );
              }
              else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          )
        ));
  }
}

