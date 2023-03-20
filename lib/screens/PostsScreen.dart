import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../model/Post.dart';
import '../widgets/AddPost.dart';
import '../widgets/PostWidget.dart';
import 'AlbumsScreen.dart';
import 'PhotosScreen.dart';

class PostsScreen extends StatelessWidget {

  int _selectedIndex = 0;

  PostsScreen({super.key});

  late Future<List<Post>> futurePost = Post.fetchPost();

  @override
  Widget build(BuildContext context) {
    return Scaffold(



      appBar: AppBar(backgroundColor: Colors.blue, title: const Text("Posty")),
      //floatingActionButton: AddPost(),
      body: Center(
        child: FutureBuilder<List<Post>>(
          future: futurePost,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return PostWidget(
                      post: Post(
                          snapshot.data![index].id,
                          snapshot.data![index].userId,
                          snapshot.data![index].title,
                          snapshot.data![index].body,
                          snapshot.data![index].user),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
