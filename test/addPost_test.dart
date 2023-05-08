import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projekt_zaliczeniowy/widgets/AddPost.dart';

void main() {
  testWidgets('Add Post Tests',
          (WidgetTester tester) async {

        await tester.pumpWidget(MaterialApp(home: AddPost()));

        expect(find.text("Dodaj Post"), findsOneWidget);
        expect(find.text("Tytuł Posta"), findsOneWidget);
        expect(find.text("Treść Posta"), findsOneWidget);
        expect(find.byType(SizedBox), findsWidgets);
        expect(find.byType(Icon), findsWidgets);
        expect(find.byType(AppBar), findsOneWidget);
        expect(find.byType(BackButton), findsOneWidget);
        expect(find.byType(TextField), findsNWidgets(2));
      });
}
