import 'package:http/http.dart' as http;

class ProductService {
  ProductService();

  Future<http.Response> get() async {
    return await http.get(Uri.parse('https://app-ezstock.herokuapp.com/produtos'));
  }
}
