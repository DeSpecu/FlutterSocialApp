import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projekt_zaliczeniowy/model/Album.dart';
import 'package:projekt_zaliczeniowy/model/User.dart';
import 'package:projekt_zaliczeniowy/widgets/AlbumWidget.dart';

void main() {
  testWidgets('AlbumWidget displays albums', (WidgetTester tester) async {
    final album = Album(
      1,
      1,
      'Test album title',
    );

    final futureData = Future.value(User(1, "szymon", "specu", "mail@mail.com"));

    // Build the widget without the future argument
    final widget = AlbumWidget(album: album);

    // Rebuild the widget when the future completes
    await futureData.whenComplete(() => tester.pumpWidget(widget));

    // Test the widget with the future data
    expect(find.text('Hello, world!'), findsOneWidget);

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
