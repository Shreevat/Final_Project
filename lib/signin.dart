// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:loginpage/main_lobby/cartpage.dart';
import 'package:loginpage/bottomnav.dart';
import 'package:loginpage/models/const.dart';
import 'package:loginpage/signup.dart';

class signin extends StatefulWidget {
  const signin({Key? key}) : super(key: key);

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                Image.asset('images/logo.png'),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    'login to your account',
                    style: TextStyle(color: Colors.amber),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'email',
                    enabledBorder: eBorderInputDecoration,
                    focusedBorder: fBorderInputDecoration,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    enabledBorder: eBorderInputDecoration,
                    focusedBorder: fBorderInputDecoration,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value;
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Remember Me: ',
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ], //<Widget>[]
                ), //Row
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 79, 76, 175))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => bottom_nav()),
                        );
                      },
                      child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Signin',
                            textAlign: TextAlign.center,
                          ))),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(children: [
                          TextSpan(
                              text: "Don't have an account?  ",
                              style: TextStyle(color: Colors.black)),
                        ])),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => signup()),
                          );
                        },
                        child: Container(
                          child: Text(
                            'Signup',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromARGB(255, 76, 83, 175),
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  ],
                ),
              ]),
            ),
          ],
        ),
      )),
    );
  }
}
