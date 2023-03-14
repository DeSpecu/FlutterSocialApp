import 'package:flutter/material.dart';


class PhotoScreen extends StatelessWidget {
  const PhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Photos'),
        ),
        body: ListView.builder(itemBuilder: (_, index) {
          return Column(
          );
        })
    );
  }
}
