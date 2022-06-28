import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:loginpage/main_lobby/cartpage.dart';
import 'package:loginpage/models/place_model.dart';

class ItemPage extends StatefulWidget {
  final Places currentPlace;
  ItemPage({Key? key, required this.currentPlace}) : super(key: key);

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 236, 236),
      appBar: AppBar(
        title: Text('Details'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image.network(
                  'http://mark.bslmeiyu.com/uploads/${widget.currentPlace.img.toString()}',
                ),
              ),
              Text(widget.currentPlace.name.toString()),
              Text(
                'Description',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(widget.currentPlace.description.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
