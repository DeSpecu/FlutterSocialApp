import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:projekt_zaliczeniowy/model/Album.dart';
import 'package:projekt_zaliczeniowy/model/Comments.dart';
import 'package:projekt_zaliczeniowy/model/Post.dart';
import 'package:projekt_zaliczeniowy/model/User.dart';
import 'package:projekt_zaliczeniowy/widgets/AlbumWidget.dart';
import 'package:projekt_zaliczeniowy/widgets/CommentWidget.dart';
import 'package:projekt_zaliczeniowy/widgets/PostWidget.dart';
import 'package:http/http.dart' as http;

void main() {
  testWidgets('AlbumWidget displays albums', (WidgetTester tester) async {

   
    final album = Album(
      1,
      1,
      'Test album title',
    );

    await tester.pumpWidget(MaterialApp(
        home: AlbumWidget(
      album: album,
    )));

    expect(find.text(album.title), findsOneWidget);
    expect(find.byType(Card), findsOneWidget);
    expect(find.byType(InkWell), findsOneWidget);
    expect(find.byType(Container), findsOneWidget);
    expect(find.byType(Column), findsNWidgets(2));

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
