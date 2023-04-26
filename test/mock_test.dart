import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('API test', () async {
    var client = MockClient((request) async {
      return http.Response('[{"id": 1, "title": "Test title", "body": "Test body"}]', 200);
    });

    var response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    expect(response.statusCode, 200);
    expect(response.body, isNotNull);
  });
}
