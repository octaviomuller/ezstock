import 'package:ezstock/screens/InfoScreen.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class ListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final Random random = new Random();

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InfoScreen(item: 'product'),
          ),
        );
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/image${random.nextInt(9)}.webp',
                height: screenSize.height * (0.23),
                width: screenSize.height * (0.23),
                fit: BoxFit.cover,
              ),
              clipBehavior: Clip.hardEdge,
            ),
            Text(
              "Nome da peça",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: screenSize.height * 0.03,
                color: Colors.grey.shade600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "Em estoque: 10",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: screenSize.height * 0.02,
                color: Colors.grey.shade700,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "R\$89,99",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: screenSize.height * 0.028,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
