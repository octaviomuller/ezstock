import 'package:flutter/material.dart';
import 'package:ezstock/widgets/AppBarWidget.dart';
import 'package:ezstock/screens/VendidosScreen.dart';
import 'package:ezstock/screens/home/HomeScreen.dart';
import 'package:ezstock/screens/ProdutosScreen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.purple.shade700),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 1; //tab index

  final tabs = <Widget>[EstoqueScreen(), HomeScreen(), VendidosScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarWidget(),
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.purple.shade700,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark), //TODO: change estoque icon
            title: Title(
              child: Text("Produtos"),
              color: Colors.blue,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Title(
              child: Text("Home"),
              color: Colors.blue,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            title: Title(
              child: Text("Vendidos"),
              color: Colors.blue,
            ),
          )
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
