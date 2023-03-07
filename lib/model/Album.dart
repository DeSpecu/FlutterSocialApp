import 'package:http/http.dart' as http;

class Album{
  final int id;
  final int userId;
  final String title;

  Album(
      this.id,
      this.userId,
      this.title
      );

}