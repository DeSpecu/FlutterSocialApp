import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  int id;
  String name;
  String username;
  String email;
  User(
      this.id,
      this.name,
      this.username,
      this.email,
      );

  factory User.fromJson(Map<String, dynamic> json) {
    return User(json['id'], json['name'], json['username'], json['email']);
  }

  static Future<User> fetchUser(int id) async {
    final response =
    await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/$id'));

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      return User.fromJson(result);
    } else {
      throw Exception('Failed to load user');
    }
  }
}