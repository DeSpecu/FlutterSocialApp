import 'dart:convert';
import 'package:http/http.dart' as http;

class Post {
  int id;
  int userId;
  String title;
  String body;

  Post(this.id, this.userId, this.title, this.body);

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(json['id'], json['userId'], json['title'], json['body']);
  }

  static Future<List<Post>> fetchPost() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      final List result = json.decode(response.body);
      return result.map((x) => Post.fromJson(x)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}
