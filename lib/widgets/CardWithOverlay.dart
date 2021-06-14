import 'dart:io';
import 'dart:math';

import 'package:ezstock/screens/InfoScreen.dart';
import 'package:flutter/material.dart';

class CardWithOverlay extends StatelessWidget {
  CardWithOverlay({this.type, this.image, this.title, this.vendidos});
  final String type;
  final File image;
  final String title;
  final String vendidos;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InfoScreen(item: 'product'),
          ),
        );
      },
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(type == "big" ? 12.0 : 8.0),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Image.file(
                image,
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
                        title,
                        style: TextStyle(
                          fontSize: type == "big" ? 25.0 : 20,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (type == "big")
                        Text(
                          'Vendidos: ' + vendidos,
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
        ),
        decoration: new BoxDecoration(
          boxShadow: [
            new BoxShadow(
              color: Colors.grey.shade600,
              blurRadius: 7.0,
              offset: Offset(4, 2),
            ),
          ],
        ),
      ),
    );
  }
}
