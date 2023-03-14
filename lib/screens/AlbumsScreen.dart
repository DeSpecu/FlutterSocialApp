import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projekt_zaliczeniowy/model/Photo.dart';

import '../widgets/Drawer.dart';
import '../widgets/PhotoWidget.dart';

class AlbumsScreen extends StatelessWidget {
  late Future<List<Photo>> futurePhoto = Photo.fetchPhoto();

  AlbumsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: FlutterSocialAppDrawer(),
        appBar:
            AppBar(backgroundColor: Colors.blue, title: const Text("Albums")),
        body: Center(
            child: FutureBuilder<List<Photo>>(
                future: futurePhoto,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(itemBuilder: (context, index) {
                      return PhotoWidget(
                          photo: Photo(
                              snapshot.data![index].albumId,
                              snapshot.data![index].id,
                              snapshot.data![index].title,
                              snapshot.data![index].url,
                              snapshot.data![index].thumbnailUrl,
                              snapshot.data![index].album));
                    });
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                })));
  }
}
