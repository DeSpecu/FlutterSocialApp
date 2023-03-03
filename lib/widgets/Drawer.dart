import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projekt_zaliczeniowy/screens/AlbumsScreen.dart';
import 'package:projekt_zaliczeniowy/screens/PostsScreen.dart';

import '../main.dart';

class FlutterSocialAppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Column(children: [
        ListTile(
          title: Text("Posty", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
          onTap: () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const PostsScreen()))
          },
        ),
        ListTile(
          title: Text("Albums", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
          onTap: () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AlbumsScreen()))
          },
        ),
      ],)

    );
  }
}
