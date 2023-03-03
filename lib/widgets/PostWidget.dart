import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projekt_zaliczeniowy/model/Post.dart';
import 'package:projekt_zaliczeniowy/widgets/UserWidget.dart';
import '../main.dart';
import '../model/User.dart';

class PostWidget extends StatelessWidget {
  User user;
  Post post;

  PostWidget({required this.user, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 16,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: UserWidget(user: user)
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SelectableText(post.title),
                  SizedBox(height: 5),
                  SelectableText(post.body),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    FloatingActionButton.extended(
                      onPressed: () => {},
                      label: Text("Komentarze"),
                      icon: Icon(
                        Icons.comment,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
