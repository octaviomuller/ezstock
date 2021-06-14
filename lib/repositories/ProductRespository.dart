import 'dart:convert';

import 'package:ezstock/models/Product.dart';
import 'package:ezstock/service.dart';
import 'package:http/http.dart';

class ProductRepository {
  final Service productService = Service();

  ProductRepository();

  Future<List<Product>> get() async {
    List<Product> products = [];

    Response response = await productService.get('produtos');
    dynamic object = jsonDecode(response.body);
    object.forEach((element) => products.add(Product.fromJson(element)));
    print('producst: ' + products.toString());
    return products;
  }
}