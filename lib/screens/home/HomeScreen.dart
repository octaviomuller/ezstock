// import 'package:ezstock/screens/home/sections/LastSold.dart';
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: MostSold(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
