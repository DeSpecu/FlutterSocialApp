import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projekt_zaliczeniowy/model/Post.dart';
import 'package:projekt_zaliczeniowy/model/User.dart';
import 'package:projekt_zaliczeniowy/widgets/PostWidget.dart';

void main() {
  testWidgets('PostWidget displays post information and comments',
          (WidgetTester tester) async {

        final post = Post(
          1,
          1,
          'Test post title',
          'Test post body',
          Future.value(User(1, 'Test user', 'Test_use', 'testuser@example.com')),
        );

        await tester.pumpWidget(MaterialApp(home: PostWidget(post: post,)));

        expect(find.text(post.body), findsOneWidget);
        expect(find.text(post.title), findsOneWidget);
        expect(find.byType(FloatingActionButton), findsOneWidget);
        expect(find.byType(Icon), findsOneWidget);
        expect(find.byType(Text), findsOneWidget);
        expect(find.byType(Card), findsOneWidget);
        expect(find.byType(Column), findsWidgets);
      });
}
