import 'dart:convert';

import 'package:http/http.dart' as http;
class Comment{
  int id;
  int postId;
  String name;
  String email;
  String body;
  Comment(
      this.id,
      this.postId,
      this.name,
      this.email,
      this.body
      );

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(json['id'], json['postId'], json['name'], json['email'],
        json['body']);
  }
  static Future<List<Comment>> fetchComments(postId) async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments?postId=$postId'));

    if (response.statusCode == 200) {
      final List result = json.decode(response.body);
      return result.map((x) => Comment.fromJson(x)).toList();
    } else {
      throw Exception('Failed to load photo');
    }
  }

}