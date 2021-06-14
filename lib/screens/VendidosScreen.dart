import 'package:ezstock/controllers/controller.dart';
import 'package:ezstock/models/Sell.dart';
import 'package:ezstock/widgets/ListItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VendidosScreen extends StatefulWidget {
  @override
  _VendidosScreenState createState() => _VendidosScreenState();
}

class _VendidosScreenState extends State<VendidosScreen> {
  final Controller controller = Controller();

  List<ListItem> getSellItems(items) {
    List<ListItem> list = [];

    for(dynamic item in items) {
      list.add(ListItem(item));
    }

    return list;
  }

  Future<List<Sell>> fetchData() async {
    List<Sell> stocks = await controller.getSell();
    await Future.delayed(Duration(seconds: 2));
    return Future.value(stocks);
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return FutureBuilder(
      future: fetchData(),
      builder: (BuildContext context, AsyncSnapshot<List<Sell>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Center(child: const CircularProgressIndicator());
        if (snapshot.hasData)
          return Scaffold(
          body: GridView.count(
            primary: false,
            padding: const EdgeInsets.only(top: 12.0, right: 10.0, left: 10.0),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            childAspectRatio:
                (screenSize.height * (0.20)) / (screenSize.height * (0.32)),
            children: getSellItems(snapshot.data),
          ),
        );
        else
          return const Text('Some error happened');
      },
    );
  }
}
