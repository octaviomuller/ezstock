import 'dart:async';
import 'dart:convert';

import 'package:ezstock/models/Product.dart';
import 'package:http/http.dart' as http;

class Service {
  Future<List<Product>> getAllProducts() async {
    final response = await http
        .get(Uri.parse('https://app-ezstock.herokuapp.com/produtos'));

    if (response.statusCode == 200) {
      List<Product> products = [];

      for (dynamic x in jsonDecode(response.body)) {
        products.add(Product.fromJson(x));
      }

      return products;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
