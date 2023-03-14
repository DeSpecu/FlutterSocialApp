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

  static Future<Album> fetchAlbum(int id) async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'));

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      return Album.fromJson(result);
    } else {
      throw Exception('Failed to load album');
    }
  }
}
