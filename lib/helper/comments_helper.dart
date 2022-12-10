import 'package:http/http.dart' as http;

import 'package:api_practice/model/comments.dart';

class CommentHelper {
  Future<List<Welcome>?> getComment() async {
    var response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    if (response.statusCode == 200) {
      var json = response.body;
      return welcomeFromJson(json);
    }
  }
}
