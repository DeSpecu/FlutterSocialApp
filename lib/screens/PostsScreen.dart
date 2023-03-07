import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../model/Post.dart';
import '../model/User.dart';
import '../widgets/Drawer.dart';
import '../widgets/PostWidget.dart';

class PostsScreen extends StatelessWidget {
  PostsScreen({super.key});

  late Future<List<Post>> futurePost = Post.fetchPost();
  late Future<List<Post>> futurePost2 = Post.fetchPost();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: FlutterSocialAppDrawer(),
      appBar: AppBar(backgroundColor: Colors.blue, title: const Text("Posty")),
      body: Center(
        child: FutureBuilder<List<Post>>(
          future: futurePost,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(itemBuilder: (context, index) {
                return PostWidget(
                    post: Post(
                        snapshot.data![index].id,
                        snapshot.data![index].userId,
                        snapshot.data![index].title,
                        snapshot.data![index].body),
                    user: User(1, "Josef Bratan", "jozek", "email@moje.pl"));
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
