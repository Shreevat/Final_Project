import 'package:flutter/material.dart';
//import 'package:loginpage/main_lobby/cartpage1.dart';
import 'package:loginpage/main_lobby/cartpg.dart';
import 'package:loginpage/main_lobby/HomePage.dart';
import 'package:loginpage/main_lobby/offers.dart';
import 'package:loginpage/main_lobby/profile.dart';
import 'package:loginpage/models/place_model.dart';

class bottom_nav extends StatefulWidget {
  const bottom_nav({Key? key}) : super(key: key);

  @override
  State<bottom_nav> createState() => _bottom_navState();
}

class _bottom_navState extends State<bottom_nav> {
  int _currentindex = 0;
  // onTap() {
  //   Navigator.of(context).push(MaterialPageRoute(
  //       builder: (BuildContext context) =>
  //           _children[_currentindex])); // this has changed
  // }

  final List<Widget> _children = [HomePage(), CartPage(), Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentindex],
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
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.local_offer_outlined),
          //   label: 'Offers',
          // ),
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
