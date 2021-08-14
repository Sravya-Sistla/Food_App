import 'package:flutter/material.dart';
import 'package:food_order/User/login.dart';
import 'package:food_order/User/register.dart';

// ignore: camel_case_types
class userwelcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Center(
                  child: Image.asset(
                    'assets/chef.png',
                  ),
                ),
              )),
          Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Welcome USER",
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Column(
                      children: [
                        Text(
                          "Order food from our restaurant and",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Text("make reservation in real-time"),
                      ],
                    ),
                    Container(
                        height: 60.0,
                        width: 300,
                        child: RaisedButton(
                          color: Colors.orangeAccent,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.orangeAccent, width: 2.0),
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        login()));
                          },
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )),
                    Container(
                        height: 60.0,
                        width: 300,
                        child: RaisedButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.orangeAccent, width: 2.0),
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        register()));
                          },
                          child: Text(
                            "SIGN-UP",
                            style: TextStyle(
                              color: Colors.orangeAccent,
                            ),
                          ),
                        ))
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
