import 'dart:io'; // will be used for file image

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageCarrousel extends StatefulWidget {
  final List<String> imgList;
  ImageCarrousel({@required this.imgList});

  @override
  _ImageCarrouselState createState() => _ImageCarrouselState();
}

class _ImageCarrouselState extends State<ImageCarrousel> {
  List<Widget> imageSliders = [];
  final CarouselController _controller = CarouselController();
  int currentPage = 0;
  double height = 100, width = 100;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    buildList(screenSize);

    return Container(
      child: Stack(
        children: <Widget>[
          CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
              enlargeCenterPage: false,
              viewportFraction: 1.0,
              height: screenSize.height * 0.45,
              onPageChanged: (index, reason) {
                setState(() {
                  currentPage = index;
                });
              },
            ),
            carouselController: _controller,
          ),
          // Positioned(
          //   bottom: screenSize.height * 0.12,
          //   right: screenSize.width * 0.01,
          //   child: IconButton(
          //     iconSize: screenSize.height * 0.05,
          //     splashRadius: 0.1,
          //     icon: const Icon(Icons.arrow_forward_ios),
          //     onPressed: () {
          //       _controller.nextPage();
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }

  void buildList(Size screenSize) {
    imageSliders = widget.imgList
        .map(
          (item) => Container(
            child: Center(
              // TODO: remove this
              child: Image.asset(
                item,
                width: screenSize.width,
                fit: BoxFit.cover,
              ),
              // TODO: uncomment under
              // child: Image.file(
              //   File(item),
              //   width: screenSize.width,
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
        )
        .toList();
  }
}
