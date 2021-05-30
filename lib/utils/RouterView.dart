import 'package:ezstock/screens/InfoScreen.dart';
import 'package:flutter/material.dart';
import 'package:ezstock/utils/Magic.dart';
import 'package:ezstock/screens/NewProductForm.dart';

class RouterView {
  // ignore: missing_return
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case newProductForm:
        return MaterialPageRoute(builder: (_) => NewProductForm());
      case infoProduct:
        return MaterialPageRoute(builder: (_) => InfoScreen());
    }
  }
}
