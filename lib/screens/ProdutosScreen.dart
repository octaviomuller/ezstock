import 'package:ezstock/provider.dart';
import 'package:ezstock/utils/Magic.dart';
import 'package:ezstock/utils/Service.dart';
import 'package:ezstock/widgets/ListItem.dart';
import 'package:flutter/material.dart';

class EstoqueScreen extends StatefulWidget {
  @override
  _EstoqueScreenState createState() => _EstoqueScreenState();
}

class _EstoqueScreenState extends State<EstoqueScreen> {
  List<ListItem> getStocksItems(items) {
    List<ListItem> list = [];

    for(dynamic item in items) {
      list.add(ListItem(item));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.only(top: 12.0, right: 10.0, left: 10.0),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        childAspectRatio:
            (screenSize.height * (0.13)) / (screenSize.height * (0.32)),
        children: getStocksItems(Provider.of(context).stocks),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pushNamed(context, newProductForm, arguments: null),
        child: Icon(Icons.add),
        backgroundColor: Colors.purple.shade700,
      ),
    );
  }
}
