import 'package:ezstock/controllers/controller.dart';
import 'package:ezstock/models/Stock.dart';
import 'package:ezstock/utils/Magic.dart';
import 'package:ezstock/utils/Service.dart';
import 'package:ezstock/widgets/ListItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EstoqueScreen extends StatefulWidget {
  @override
  _EstoqueScreenState createState() => _EstoqueScreenState();
}

class _EstoqueScreenState extends State<EstoqueScreen> {
  final Controller controller = Controller();

  List<ListItem> getStocksItems(items) {
    List<ListItem> list = [];

    for (dynamic item in items) {
      list.add(ListItem(item));
    }

    return list;
  }

  Future<List<Stock>> fetchData() async {
    List<Stock> stocks = await controller.getStock();
    await Future.delayed(Duration(seconds: 2));
    return Future.value(stocks);
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return FutureBuilder(
      future: fetchData(),
      builder: (BuildContext context, AsyncSnapshot<List<Stock>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Center(child: const CircularProgressIndicator());
        if (snapshot.hasData)
          return Scaffold(
            body: GridView.count(
              primary: false,
              padding:
                  const EdgeInsets.only(top: 12.0, right: 10.0, left: 10.0),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              childAspectRatio:
                  (screenSize.height * (0.20)) / (screenSize.height * (0.32)),
              children: getStocksItems(snapshot.data),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () =>
                  Navigator.pushNamed(context, newProductForm, arguments: null),
              child: Icon(Icons.add),
              backgroundColor: Colors.purple.shade700,
            ),
          );
        else
          return const Text('Some error happened');
      },
    );
  }
}
