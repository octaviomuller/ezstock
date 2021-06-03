import 'package:ezstock/screens/search/Categoriesgrid.dart';
import 'package:flutter/material.dart';

class SearchCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Column(
        children: <Widget>[
          Text(
            "CATEGORIAS",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: screenSize.height * 0.022,
            ),
          ),
          Expanded(
            child: CategoriesGrid(),
          ),
        ],
      ),
    );
  }
}
