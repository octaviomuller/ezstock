import 'package:ezstock/widgets/CardWithOverlay.dart';
import 'package:flutter/material.dart';

class MostSold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        CardWithOverlay(type: "big")
      ],
    );
  }
}
