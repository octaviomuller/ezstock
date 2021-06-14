import 'package:ezstock/models/Product.dart';

class Sell {
  final int id;
  final int quantity;
  final String date;
  final Product product;

  Sell(
    this.id,
    this.quantity,
    this.date,
    this.product,
  );

  factory Sell.fromJson(Map<String, dynamic> json) {
    return Sell(
      json["id"],
      json["quantidade"],
      json["dataVenda"],
      Product.fromJson(json["produto"]),
    );
  }
}
