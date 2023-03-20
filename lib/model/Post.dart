import 'dart:convert';
import 'package:http/http.dart' as http;
import 'User.dart';

class Post {
  int id;
  int userId;
  String title;
  String body;
  Future<User> user;

  Post(this.id, this.userId, this.title, this.body, this.user);

  factory Post.fromJson(Map<String, dynamic> json, int userId) {
    return Post(json['id'], json['userId'], json['title'], json['body'], User.fetchUser(userId));
  }

  static Future<List<Post>> fetchPost() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      final List result = json.decode(response.body);
      return result.map((x) => Post.fromJson(x, x['userId'])).toList();
    } else {
      throw Exception('Failed to load post');
    }
  }
}
