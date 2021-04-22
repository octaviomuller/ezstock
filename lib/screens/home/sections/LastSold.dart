import 'package:ezstock/widgets/CardWithOverlay.dart';
import 'package:flutter/material.dart';

class LastSold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          child: ListView(scrollDirection: Axis.horizontal, children: list),
        ),
      ],
    );
  }

  final List<Widget> list = [
    Padding(
      padding: const EdgeInsets.all(6.0),
      child: CardWithOverlay(),
    ),
    Padding(
      padding: const EdgeInsets.all(6.0),
      child: CardWithOverlay(),
    ),
    Padding(
      padding: const EdgeInsets.all(6.0),
      child: CardWithOverlay(),
    ),
    Padding(
      padding: const EdgeInsets.all(6.0),
      child: CardWithOverlay(),
    ),
    Padding(
      padding: const EdgeInsets.all(6.0),
      child: CardWithOverlay(),
    ),
    Padding(
      padding: const EdgeInsets.all(6.0),
      child: CardWithOverlay(),
    ),
  ];
}
