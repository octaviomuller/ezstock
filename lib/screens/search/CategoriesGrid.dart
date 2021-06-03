import 'package:ezstock/widgets/CategoryCard.dart';
import 'package:flutter/material.dart';

class CategoriesGrid extends StatelessWidget {
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
            (screenSize.height * (0.23)) / (screenSize.height * (0.23)),
        children: [
          CategoryCard(name: 'moletons'),
          CategoryCard(name: 'vestidos'),
          CategoryCard(name: 'calças'),
          CategoryCard(name: 'sapatos'),
          CategoryCard(name: 'jaquetas'),
          CategoryCard(name: 'saias'),
        ],
      ),
    );
  }
}
