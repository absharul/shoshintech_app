import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({Key? key}) : super(key: key);

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final List<String> imagePaths = [
    'assets/images/img_one.jpg',
    'assets/images/img_two.jpeg',
    'assets/images/img_three.jpeg',
    'assets/images/img_four.jpg',
    'assets/images/img_five.jpeg',
  ];

  List _items = [];

  @override
  void initState() {
    super.initState();
    readJson();
  }

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/Json/dummy_details.json');
    final data = await json.decode(response);
    setState(() {
      _items = List.from(data);
      print("..number of items ${_items.length}");
    });
  }

  final PageController _bannerPageController =
  PageController(viewportFraction: 0.9, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: _bannerPageController,
            itemCount: imagePaths.length,
            itemBuilder: (context, index) {
              return buildImageCard(imagePaths[index], _items[index]["offers"]);
            },
          ),
        )
      ],
    );
  }

  Widget buildImageCard(String imagePath, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.black.withOpacity(0.5),
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
