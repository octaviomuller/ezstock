import 'dart:convert';

class Product {
  final int id;
  final String name;
  final String productCode;
  final String category;
  final double price;
  final String size;
  final bool used;
  final List<String> image;

  Product(
    this.id,
    this.name,
    this.productCode,
    this.category,
    this.price,
    this.size,
    this.used,
    this.image,
  );

  factory Product.fromJson(Map<String, dynamic> json) {
    List<String> images = [];
    json["imagens"].forEach((element) => images.add(element));
    
    return Product(
      json["id"],
      json["nome"],
      json["codigoProduto"],
      json["categoria"],
      json["preco"],
      json["tamanho"],
      json["ehUsado"],
      images,
    );
  }
}
