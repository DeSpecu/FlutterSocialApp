import 'package:flutter/material.dart';
import 'package:projekt_zaliczeniowy/model/Photo.dart';

import '../widgets/PhotoWidget.dart';


class PhotoScreen extends StatelessWidget {
  PhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic> ;
    final String title = args['title'];
    final int albumId = args['albumId'];
    late Future<List<Photo>> photos = Photo.fetchPhotosFromAlbum(albumId);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(title),
        ),
        body: FutureBuilder<List<Photo>>(
          future: photos,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                return PhotoWidget(
                  photo: snapshot.data![index],
                );
              });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },

        ),
    );
  }
}
