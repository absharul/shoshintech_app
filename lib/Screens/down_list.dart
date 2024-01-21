import 'dart:convert';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intern_app/utils/color.dart';

class DownScreenList extends StatefulWidget {
  const DownScreenList({Key? key}) : super(key: key);

  @override
  State<DownScreenList> createState() => _DownScreenListState();
}

class _DownScreenListState extends State<DownScreenList> {
  List _items = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/Json/dummy_details.json');
    final data = await json.decode(response);
    setState(() {
      _items = List.from(data);
      print("..number of items ${_items.length}");
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  final PageController _downscreelistcontroller =
  PageController(viewportFraction: 0.9, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 360,
          child: ListView.builder(
            controller: _downscreelistcontroller,
            itemCount: _items.length,
            itemBuilder: (context, index){
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: const BorderSide(
                    color: AppColor.backgroundColor,
                  ),
                ),
                elevation: 2,
                margin: const EdgeInsets.all(8),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child:  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(_items[index]["logo"]),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_items[index]["title"]),
                            Text(_items[index]["description"],style: const TextStyle(fontSize: 12.0),),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Handle "View Details" button tap
                          print('View Details button tapped');
                        },
                        child: const Text(
                          'View Details',
                          style: TextStyle(
                            color: Colors.blue, // Choose a color for the button text
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );

            },
          ),
        ),
      ],
    );
   }
}
