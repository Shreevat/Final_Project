import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loginpage/models/place_model.dart';
import 'package:loginpage/signin.dart';
import 'package:loginpage/signup.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
      backgroundColor: Color.fromARGB(255, 239, 236, 236),
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
                    enlargeCenterPage: false,
                    enableInfiniteScroll: true,
                    autoPlay: false,
                  ),
                  items: imgList
                      .map((anystring) => ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Stack(
                              children: <Widget>[
                                Image.asset(
                                  anystring.toString(),
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
                                                Image.network(
                                                  'http://mark.bslmeiyu.com/uploads/${placeList[index].img.toString()}',
                                                  width: 50,
                                                  height: 50,
                                                ),
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
    );
  }
}
