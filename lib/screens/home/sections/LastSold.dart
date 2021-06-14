import 'dart:io';

import 'package:ezstock/controllers/controller.dart';
import 'package:ezstock/widgets/CardWithOverlay.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LastSold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Controller>(
      builder: (BuildContext context, Controller value, Widget child) {
        if (!value.sells.isEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Text(
                  'Últimos Vendidos',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.grey.shade800,
                  ),
                ),
              ),
              // CardWithOverlay()
              Container(
                height: 180,
                child:
                    ListView(scrollDirection: Axis.horizontal, children: listGenerator(value.sells)),
              ),
            ],
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  List<Widget> listGenerator(dynamic sells) {
    List<Widget> list = [];
    for (int i = sells.length - 1; i >= 0; i--) {
      list.add(
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: CardWithOverlay(image: File(sells[i].product.image[0]), title: sells[i].product.name),
        ),
      );
    }
    return list;
  }
}
