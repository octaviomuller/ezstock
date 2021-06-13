import 'package:ezstock/models/Product.dart';
import 'package:ezstock/models/Sell.dart';
import 'package:ezstock/models/Stock.dart';
import 'package:flutter/material.dart';

class Provider extends InheritedWidget {
  const Provider({
    Key key,
    this.products,
    // this.stocks,
    // this.sells,
    Widget child,
  }) : super(key: key, child: child);

  final List<Product> products;
  // final List<Stock> stocks;
  // final List<Sell> sells;

  static Provider of(BuildContext context) {
    final Provider result = context.dependOnInheritedWidgetOfExactType<Provider>();
    assert(result != null, 'No Provider found in context');
    return result;
  }

  @override
  bool updateShouldNotify(Provider old) => products != old.products;
}