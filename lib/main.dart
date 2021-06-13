import 'package:ezstock/models/Product.dart';
import 'package:ezstock/provider.dart';
import 'package:ezstock/repositories/ProductRespository.dart';
import 'package:ezstock/screens/search/SearchCategories.dart';
import 'package:ezstock/utils/RouterView.dart';
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
      onGenerateRoute: RouterView.generateRoute,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ProductRepository _productRepository = ProductRepository();

  int _currentIndex = 1; //tab index
  int _lastIndex = 1;
  bool _isSearching = false;

  final tabs = <Widget>[EstoqueScreen(), HomeScreen(), VendidosScreen()];
  final categories = SearchCategories();
  Future<List<Product>> products;

  @override
  void initState() {
    products = _productRepository.get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarWidget(
          setIsSearching: _setIsSearching,
          isSearching: _isSearching && (_lastIndex == _currentIndex),
        ),
      ),
      body: FutureBuilder<dynamic>(
        future: products,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Provider(
              products: snapshot.data,
              child: _isSearching && (_lastIndex == _currentIndex)
                  ? categories
                  : tabs[_currentIndex],
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
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

  void _setIsSearching(bool payload) {
    setState(() {
      if (payload) {
        _lastIndex = _currentIndex;
      }
      _isSearching = payload;
    });
  }
}
