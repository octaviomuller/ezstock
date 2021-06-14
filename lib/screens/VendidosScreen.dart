import 'package:ezstock/provider.dart';
import 'package:ezstock/widgets/ListItem.dart';
import 'package:flutter/material.dart';

class VendidosScreen extends StatefulWidget {
  @override
  _VendidosScreenState createState() => _VendidosScreenState();
}

class _VendidosScreenState extends State<VendidosScreen> {
  List<ListItem> getSellItems(items) {
    List<ListItem> list = [];

    for(dynamic item in items) {
      list.add(ListItem(item));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Center(
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.only(top: 12.0, right: 10.0, left: 10.0),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        childAspectRatio:
            (screenSize.height * (0.23)) / (screenSize.height * (0.32)),
        children: getSellItems(Provider.of(context).sells),
      ),
    );
  }
}
