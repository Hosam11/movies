import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HttpClient {
  Future<dynamic> getMoviesByUrl(url) async {
    http.Response res = await http.get(url);
    if (res.statusCode == 200) {
      print('from HttpClient resCod ${res.statusCode}');
      return convert.jsonDecode(res.body.toString());
    } else {
      print('error HttpClient');
      return Future.error(Error());
    }
  }
}
