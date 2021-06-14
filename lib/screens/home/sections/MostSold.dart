import 'dart:io';

import 'package:ezstock/controllers/controller.dart';
import 'package:ezstock/widgets/CardWithOverlay.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MostSold extends StatelessWidget {
  final Controller controller = Controller();

  dynamic mostSelled(dynamic sells) {
    int max = 0;
    for (int i = 0; i < sells.length; i++) {
      if (sells[i].quantity > max) max = i;
    }

    return sells[max];
  }

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
                  'Mais Vendido',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.grey.shade800,
                  ),
                ),
              ),
              CardWithOverlay(type: "big", image: File(mostSelled(value.sells).product.image[0]), title: mostSelled(value.sells).product.name, vendidos: mostSelled(value.sells).quantity.toString(),)
            ],
          );
        }
        return Center(child: CircularProgressIndicator(),);
      },
    );
  }
}
