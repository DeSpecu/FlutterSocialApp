import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../model/Post.dart';
import '../widgets/PostWidget.dart';

class PostsScreen extends StatelessWidget {

  PostsScreen({super.key});

  late Future<List<Post>> futurePost = Post.fetchPost();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
        AppBar(automaticallyImplyLeading: false, title: const Text("Posts")),
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
