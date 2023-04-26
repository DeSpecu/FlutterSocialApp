import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projekt_zaliczeniowy/model/Comments.dart';
import 'package:projekt_zaliczeniowy/model/Post.dart';
import 'package:projekt_zaliczeniowy/model/User.dart';
import 'package:projekt_zaliczeniowy/widgets/CommentWidget.dart';

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
    final comments = [
      Comment(
        1,
        1,
        'Test comment 1',
        'testcomment1@example.com',
        'Test comment body 1',
      ),
      Comment(
        2,
        1,
        'Test comment 2',
        'testcomment2@example.com',
        'Test comment body 2',
      ),
    ];

    // Build the PostWidget
    await tester.pumpWidget(MaterialApp(home: CommentWidget(comments[0])));

    // Verify that the post information is displayed correctly
    expect(find.text(comments[0].body), findsOneWidget);
    expect(find.text(comments[0].name), findsOneWidget);
    expect(find.text(comments[0].email), findsOneWidget);
    expect(find.byType(Card), findsOneWidget);
    expect(find.byType(Column), findsWidgets);

    // expect(find.text(post.body), findsOneWidget);
    // expect(find.byType(UserWidget), findsOneWidget);

    // Tap the "Komentarze" button to show the comments
    // await tester.tap(find.text('Komentarze'));
    // await tester.pumpAndSettle();

    // Verify that the comments are displayed correctly
    // expect(find.byType(CommentWidget), findsNWidgets(2));
    // expect(find.text(comments[0].name), findsOneWidget);
    // expect(find.text(comments[0].body), findsOneWidget);
    // expect(find.text(comments[1].name), findsOneWidget);
    // expect(find.text(comments[1].body), findsOneWidget);
  });
}
