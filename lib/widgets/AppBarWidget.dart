import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget {
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
                this.btnIcon = Icon(Icons.close);
                this.appBar = TextField(
                  autofocus: true,
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
                this.btnIcon = Icon(Icons.search);
                this.appBar = Text('Concessionária Paiv');
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
