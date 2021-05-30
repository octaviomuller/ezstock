import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({@required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/categories/$name.webp',
              height: screenSize.height * 0.23,
              width: screenSize.height * 0.23,
              fit: BoxFit.cover,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              alignment: AlignmentDirectional.center,
              height: screenSize.height * 0.23,
              width: screenSize.height * 0.23,
              color: Colors.black.withOpacity(0.6),
              child: Text(
                name.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: screenSize.height * 0.03,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
      // decoration: new BoxDecoration(
      //   boxShadow: [
      //     new BoxShadow(
      //       color: Colors.grey.shade600,
      //       blurRadius: 7.0,
      //       offset: Offset(4, 2),
      //     ),
      //   ],
      // ),
    );
  }
}
