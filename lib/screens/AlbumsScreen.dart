import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projekt_zaliczeniowy/widgets/AlbumWidget.dart';
import '../model/Album.dart';

class AlbumsScreen extends StatelessWidget {
  late Future<List<Album>> futurePhoto = Album.fetchAlbums();
  int _selectedIndex = 0;
  AlbumsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(automaticallyImplyLeading: false, title: const Text("Albums")),
        body: Center(
            child: FutureBuilder<List<Album>>(
                future: futurePhoto,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                      return AlbumWidget(album: snapshot.data![index]);
                    });
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                })));
  }
}
