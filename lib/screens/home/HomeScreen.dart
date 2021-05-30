import 'package:ezstock/screens/home/sections/LastSold.dart';
import 'package:ezstock/screens/home/sections/MostSold.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          //TODO: Make all hard coded number relative to screen size
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: MostSold(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0, left: 12.0),
              child: LastSold(),
            ),
          ],
        ),
      ),
    );
  }
}
