import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class PostVisual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: randomColor(),
      width: 600,
      height: 600,
      child: Column(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  height: 400,
                  width: 400,
                  image: NetworkImage("https://via.placeholder.com/600/d32776")),
              Text("Tak"),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FloatingActionButton(
                        onPressed: () => {},
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.comment,
                          color: Colors.black,
                        ))
                  ])
            ],
          )
        ],
      ),
    );
  }
}
