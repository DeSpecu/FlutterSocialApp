import 'package:flutter_test/flutter_test.dart';
import 'package:projekt_zaliczeniowy/model/Comments.dart';

void main() {
  group('Comment', () {
    test('fromJson should parse JSON correctly', () {
      final json = {
        'id': 1,
        'postId': 1,
        'name': 'id labore ex et quam laborum',
        'email': 'Eliseo@gardner.biz',
        'body': 'laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium'
      };
      final comment = Comment.fromJson(json);
      expect(comment.id, equals(json['id']));
      expect(comment.postId, equals(json['postId']));
      expect(comment.name, equals(json['name']));
      expect(comment.email, equals(json['email']));
      expect(comment.body, equals(json['body']));
    });

    test('fetchComments should return a list of comments', () async {
      final json = {
        'id': 1,
        'postId': 1,
        'name': 'id labore ex et quam laborum',
        'email': 'Eliseo@gardner.biz',
        'body': 'laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium'
      };
      final comment = Comment.fromJson(json);
      final comments = await Comment.fetchComments(comment.postId);
      expect(comments, isInstanceOf<List<Comment>>());
      expect(comments.isNotEmpty, isTrue);
    });
  });
}