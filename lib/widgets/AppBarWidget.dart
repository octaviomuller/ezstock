import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget {
  final ValueChanged<bool> setIsSearching;

  const AppBarWidget({this.setIsSearching});

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  Icon btnIcon = Icon(Icons.search);
  Widget appBar = Text('EzStock');

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: <Widget>[
        IconButton(
          onPressed: () {
            setState(() {
              if (this.btnIcon.icon == Icons.search) {
                widget.setIsSearching(true);
                this.btnIcon = Icon(Icons.close);
                this.appBar = TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                );
              } else {
                widget.setIsSearching(false);
                this.btnIcon = Icon(Icons.search);
                this.appBar = Text('EzStock');
              }
            });
          },
          icon: btnIcon,
        )
      ],
      title: appBar,
      backgroundColor: Colors.purple.shade700,
    );
  }
}
