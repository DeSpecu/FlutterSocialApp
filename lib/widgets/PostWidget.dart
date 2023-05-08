import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projekt_zaliczeniowy/model/Comments.dart';
import 'package:projekt_zaliczeniowy/model/Post.dart';
import 'package:projekt_zaliczeniowy/widgets/CommentWidget.dart';
import 'package:projekt_zaliczeniowy/widgets/UserWidget.dart';

class PostWidget extends StatelessWidget {
  Post post;

  PostWidget({required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 16,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: UserWidget(user: post.user)
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
                      heroTag: post.id,
                      onPressed: () {
                        late Future<List<Comment>> comments = Comment.fetchComments(post.id);
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return FutureBuilder<List<Comment>>(
                                future: comments,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return ListView.builder(
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: (context, index) {
                                      return CommentWidget(snapshot.data![index]);
                                    });
                                  } else if (snapshot.hasError) {
                                    return Text('${snapshot.error}');
                                  }

                                  // By default, show a loading spinner.
                                  return const CircularProgressIndicator();
                                },

                              );
                            });
                      },
                      label: Text('Komentarze'),
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
