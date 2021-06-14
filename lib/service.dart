import 'package:http/http.dart' as http;

class Service {
  Service();

  Future<http.Response> get(route) async {
    return await http.get(Uri.parse('https://app-ezstock.herokuapp.com/$route'));
  }
}
