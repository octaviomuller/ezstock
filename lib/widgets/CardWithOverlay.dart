import 'dart:math';

import 'package:flutter/material.dart';

class CardWithOverlay extends StatelessWidget {
  CardWithOverlay({this.type});
  final String type;
  final Random random = new Random();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(type == "big" ? 12.0 : 8.0),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image.asset(
            'assets/image${random.nextInt(4)}.webp',
            height: screenSize.height * (type == "big" ? 0.4 : 0.22),
            width: screenSize.width * (type == "big" ? 0.93 : 0.42),
            fit: BoxFit.cover,
          ),
          Container(
            alignment: AlignmentDirectional.centerStart,
            height: screenSize.height * (type == "big" ? 0.08 : 0.06),
            width: screenSize.width * (type == "big" ? 0.93 : 0.42),
            color: Colors.black.withOpacity(0.8),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Nome da Peça de Roupa',
                    style: TextStyle(
                      fontSize: type == "big" ? 25.0 : 20,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (type == "big")
                    Text(
                      'Vendidos: 14',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
