import 'package:flutter/material.dart';
import 'package:intern_app/Screens/ImageCarousel.dart';
import 'package:intern_app/Screens/cutome_drawer.dart';
import 'package:intern_app/Screens/down_list.dart';
import 'package:intern_app/utils/color.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainbackgroundColor,
      appBar: appBarFun(),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          const SizedBox(height: 1.5,),
          buildTappableImagesContainer(),
          const SizedBox(height: 10.0,),
          const Column(
            children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 25.0,),
                  Image(image: AssetImage('assets/icons/fire.png'),width: 30, height: 30,),
                  SizedBox(width: 10.0,),
                  Text("Trending Offers",style: TextStyle(fontSize: 15.0),),
                ],
              ),
               SizedBox(height: 10.0,),
              ImageCarousel(),
               SizedBox(height: 15.0,),
               Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 25.0,),
                  Image(image: AssetImage('assets/icons/application.png'),width: 30, height: 30,),
                  SizedBox(width: 10.0,),
                  Text("More Options",style: TextStyle(fontSize: 15.0),),
                ],
              ),
               SizedBox(height: 10.0,),
               DownScreenList(),
            ],
          )
        ],
      ),
    );
  }


  PreferredSizeWidget appBarFun() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70.0),
      child: AppBar(
        elevation: 0,
        backgroundColor: AppColor.primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 20.0,),
            Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 50.0),
            Container(
              width: 92.0,
              height: 35.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.white,
              ),
              child: const Row(
                children: [
                  SizedBox(width: 13.0),
                  ImageIcon(
                    AssetImage('assets/icons/wallet.png'),
                    size: 20.0,
                  ),
                  SizedBox(width: 5.0),
                  Text('\u{20B9}${450}', style: TextStyle(fontSize: 17.0),)
                ],
              ),
            )
          ],
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Image.asset('assets/icons/menu.png'), // Replace with your custom icon image path
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
    );

  }
  Widget buildTappableImagesContainer() {
    return Container(
      height: 80.0,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // const SizedBox(width: 13.0),
          _buildTappableImage('assets/icons/special-tag.png', 'All Offers'),
          // const SizedBox(width: 40.0),
          _buildTappableImage('assets/icons/gift-box.png', 'Gifts'),
          // const SizedBox(width: 40.0),
          _buildTappableImage('assets/icons/upcoming.png', 'Upcoming'),
          // const SizedBox(width: 40.0),
          _buildTappableImage('assets/icons/discount.png', 'My Offers'),
        ],
      ),
    );
  }
  Widget _buildTappableImage(String imagePath, String labelText) {
    return SizedBox(
      width: 75.0,
      child: Column(
        children: [
          IconButton(
            icon: Image.asset(imagePath,width: 40,height: 40,),
            onPressed: () {
              // Add your custom button logic here
              print('Button pressed: $imagePath');
            },
          ),
          Text(labelText),
        ],
      )
    );
  }

}