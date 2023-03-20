import 'package:flutter/material.dart';

import '../model/Post.dart';
import '../model/User.dart';

class UserWidget extends StatelessWidget {
  Future<User> user;
  UserWidget({required this.user});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FutureBuilder(future: user,
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
