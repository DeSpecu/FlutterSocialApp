import 'package:flutter/material.dart';

import '../model/Post.dart';

class UserWidget extends StatelessWidget {
  Post post;
  UserWidget({required this.post});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FutureBuilder(future: post.user,
          builder: (context, snapshot){
            if(snapshot.hasData){
              return Column(
                children: [SelectableText(snapshot.data!.name,),
                  SizedBox(height: 5),
                  SelectableText('@${snapshot.data!.username}'),],
              );
            }
            else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
           )


      ],
    );
  }
}
