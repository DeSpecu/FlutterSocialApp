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
  late Future<List<Post>> futurePost = Post.fetchPost();
  AlbumsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        drawer: FlutterSocialAppDrawer(),
    appBar: AppBar(
    backgroundColor: Colors.blue, title: const Text("Album")),
    body: Center(
      child: FutureBuilder(future: futurePost,
          builder: (context, snapshot){
            if(snapshot.hasData) {
              return AlbumWidget(
                  album: Album(1, 1, "Tytul Albumu"),
                  photo: Photo(1, 1, "thumbnail", "url", "Tytul Zdjecia"),
                  post: Post(snapshot.data![0].id,
                      snapshot.data![0].userId,
                      snapshot.data![0].title,
                      snapshot.data![0].body,
                      snapshot.data![0].user)
              );
            }
            else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          }),
    )

  );
}}
