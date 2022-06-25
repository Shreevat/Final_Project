import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loginpage/models/place_model.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // const HomePage({Key? key}) : super(key: key);
  int _currentindex = 0;
  final List<String> imgList = [
    "images/logo.png",
    "images/logo.png",
    "images/logo.png",
    "images/logo.png",
    "images/logo.png",
    "images/logo.png",
  ];

  getPlaces() async {
    var response =
        await http.get(Uri.parse("http://mark.bslmeiyu.com/api/getplaces"));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('home'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.transparent,
                padding: const EdgeInsets.symmetric(vertical: 30),
                height: 200,
                child: CarouselSlider(
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    autoPlay: false,
                  ),
                  items: imgList
                      .map((anysting) => ClipRRect(
                            //.map((AssetImage) => ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Stack(
                              children: <Widget>[
                                Image.asset(
                                  anysting.toString(),
                                  // AssetImage,
                                  width: 200,
                                  height: 100,
                                  fit: BoxFit.cover,
                                )
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
              FutureBuilder(
                  future: getPlaces(),
                  builder: ((context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return const Text('No Connection');

                      case ConnectionState.waiting:
                        return const CircularProgressIndicator();

                      case ConnectionState.done:
                        var decode = jsonDecode(snapshot.data.toString());
                        List<Places> placeList = [];
                        decode
                            .forEach((e) => placeList.add(Places.fromJson(e)));

                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: placeList.length,
                            itemBuilder: (context, index) {
                              // return Container(
                              //   card
                              //   child: Text(
                              //       placeList[index].price.toString() ?? ''),
                              // );
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.10),
                                    child: Column(
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(placeList[index]
                                                    .price
                                                    .toString()),
                                                Spacer(),
                                                Column(
                                                  children: [
                                                    Text(placeList[index]
                                                        .name
                                                        .toString()),
                                                    Text(placeList[index]
                                                        .price
                                                        .toString()),
                                                  ],
                                                ),
                                                Spacer(),
                                                Icon(Icons.shopping_cart)
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });

                      default:
                        return Text('SOme Error Occurred!');
                    }
                  }))
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer_outlined),
            label: 'Offers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
      ),
    );
  }
}
