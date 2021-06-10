import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  //TODO: Change to product
  final String item;
  InfoScreen({@required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("InfoScreen"),
      ),
    );
  }
}
