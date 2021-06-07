import 'package:ezstock/models/Product.dart';

class Stock {
  final int id;
  final int quantity;
  final DateTime date;
  final Product product;

  Stock(
    this.id,
    this.quantity,
    this.date,
    this.product,
  );

  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
      json["id"],
      json["quantidade"],
      json["dataEstoque"],
      json["produto"],
    );
  }
}
