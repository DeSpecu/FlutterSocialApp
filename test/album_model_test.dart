import 'package:flutter_test/flutter_test.dart';
import 'package:projekt_zaliczeniowy/model/Album.dart';

void main() {
  group('Album', () {
    test('fromJson should parse JSON correctly', () {
      final json = {
        'userId': 1,
        'id': 1,
        'title': 'quidem molestiae enim'
      };
      final album = Album.fromJson(json);
      expect(album.userId, equals(json['userId']));
      expect(album.id, equals(json['id']));
      expect(album.title, equals(json['title']));
    });

    test('fetchAlbums should return a list of albums', () async {
      final albums = await Album.fetchAlbums();
      expect(albums, isInstanceOf<List<Album>>());
      expect(albums.isNotEmpty, isTrue);
    });
  });
}