import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget {
  final ValueChanged<bool> setIsSearching;
  final bool isSearching;

  const AppBarWidget(
      {@required this.setIsSearching, @required this.isSearching});

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  // Icon btnIcon = Icon(Icons.search);
  // Widget appBar = Text('EzStock');

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: <Widget>[
        IconButton(
          onPressed: () {
            setState(() {
              if (!widget.isSearching) {
                widget.setIsSearching(true);
              } else {
                widget.setIsSearching(false);
              }
            });
          },
          icon: widget.isSearching ? Icon(Icons.close) : Icon(Icons.search),
        )
      ],
      title: widget.isSearching
          ? TextField(
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                fillColor: Colors.white,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            )
          : Text("EzStock"),
      backgroundColor: Colors.purple.shade700,
    );
  }
}
