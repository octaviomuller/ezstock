import 'dart:convert';

import 'package:ezstock/models/Product.dart';
import 'package:ezstock/services/ProductService.dart';
import 'package:http/http.dart';

class ProductRepository {
  final ProductService productService = ProductService();

  ProductRepository();

  Future<List<Product>> get() async {
    List<Product> products = [];

    Response response = await productService.get();
    dynamic object = jsonDecode(response.body);
    object.forEach((element) => products.add(Product.fromJson(element)));
    print('producst: ' + products.toString());
    return products;
  }
}