
import 'package:flutter/material.dart';

import '../model/Comments.dart';

class CommentWidget extends StatelessWidget{
  Comment comment;
  CommentWidget(this.comment);
  @override
  Widget build(BuildContext context) {
    return Card(child: Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(comment.email, style: TextStyle(fontSize: 10),),
          Text(comment.name, style: TextStyle(fontSize: 20),),
          Text(comment.body, style: TextStyle(fontSize: 15),)
        ],),
    ),
    );
  }
  
}