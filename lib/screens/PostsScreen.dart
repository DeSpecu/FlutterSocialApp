import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../model/Post.dart';
import '../model/User.dart';
import '../widgets/Drawer.dart';
import '../widgets/PostWidget.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            drawer: FlutterSocialAppDrawer(),
            appBar: AppBar(
                backgroundColor: Colors.blue, title: const Text("Posty")),
            body: ListView.builder(itemBuilder: (_, index) {
              return PostWidget(
                  post: Post(1, 1, "Tytuł posta",
                      "Tresc posta lorem impsum i te sprawy"),
                  user: User(1, "Josef Bratan", "jozek", "email@moje.pl"));
            })
        );
  }
}
