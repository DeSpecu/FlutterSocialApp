// import 'dart:convert';
//
// import '../model/Post.dart';
// import '../model/User.dart';
//
// class CompletePost{
//   static get http => null;
//
//   static Future<Map<Post, User>> fetchPost() async {
//     final responsePost =
//     await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
//     final responseUser =
//     await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
//
//     if (responsePost.statusCode == 200 && responseUser.statusCode == 200) {
//       final List resultPost = json.decode(responsePost.body);
//       final List resultUser = json.decode(responseUser.body);
//       Future<List<Post>> retunable = Future<List<Post>>();
//       return result.map((x) => Post.fromJson(x)).toList();
//     } else {
//       throw Exception('Failed to load album');
//     }
//   }
// }