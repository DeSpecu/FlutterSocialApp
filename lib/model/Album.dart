import 'dart:convert';

import 'package:http/http.dart' as http;

class Album {
  int userId;
  int id;
  String title;

  Album(this.userId, this.id, this.title);

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(json['userId'], json['id'], json['title']);
  }

  static Future<List<Album>> fetchAlbums() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/'));

    if (response.statusCode == 200) {
      final List result = json.decode(response.body);
      return result.map((x) => Album.fromJson(x)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}
