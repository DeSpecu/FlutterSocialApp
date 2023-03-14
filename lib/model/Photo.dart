import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Album.dart';

class Photo {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;
  Future<Album> album;

  Photo(
      this.albumId, this.id, this.title, this.url, this.thumbnailUrl, this.album);

  factory Photo.fromJson(Map<String, dynamic> json, int albumId) {
    return Photo(json['albumId'], json['id'], json['title'], json['url'],
        json['thumbnailUrl'], Album.fetchAlbum(albumId));
  }

  static Future<List<Photo>> fetchPhoto() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if (response.statusCode == 200) {
      final List result = json.decode(response.body);
      return result.map((x) => Photo.fromJson(x, x['albumId'])).toList();
    } else {
      throw Exception('Failed to load photo');
    }
  }
}
