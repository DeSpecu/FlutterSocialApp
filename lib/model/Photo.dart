import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Album.dart';

class Photo {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  Photo(
      this.albumId, this.id, this.title, this.url, this.thumbnailUrl);

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(json['albumId'], json['id'], json['title'], json['url'],
        json['thumbnailUrl']);
  }

  static Future<List<Photo>> fetchPhotosFromAlbum(albumid) async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos?albumId=$albumid'));

    if (response.statusCode == 200) {
      final List result = json.decode(response.body);
      return result.map((x) => Photo.fromJson(x)).toList();
    } else {
      throw Exception('Failed to load photo');
    }
  }
}