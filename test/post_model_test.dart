import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:projekt_zaliczeniowy/model/Post.dart';
import 'package:http/http.dart' as http;

void main() {
  group('Post', () {
    test('fromJson should parse JSON correctly', () {
      final json = {
        "userId": 1,
        "id": 1,
        "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
        "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
      };
      final post = Post.fromJson(json, 1);
      expect(post.id, equals(json['id']));
      expect(post.userId, equals(json['userId']));
      expect(post.title, equals(json['title']));
      expect(post.body, equals(json['body']));
    });

    test('fetchPosts should return a list of posts', () async {
      final posts = await Post.fetchPost();
      expect(posts, isInstanceOf<List<Post>>());
      expect(posts.isNotEmpty, isTrue);
    });
  });

  test('should create a new post with the given title and body', () async {
    final postTitle = 'Test Post';
    final postBody = 'This is a test post';
    final postResponse = jsonEncode({
      'title': postTitle,
      'body': postBody,
      'userId': 1,
      'id': 101
    });
    MockClient((request) async {
      expect(request.body, postResponse);
      return http.Response(postResponse, 201);
    });

    Post.createPost(postTitle, postBody);
  });

}