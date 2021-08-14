import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_order/home.dart';
import 'package:food_order/User/register.dart';

import '../main.dart';

class login extends StatefulWidget {
  static const String idScreen = "login";

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController emailtextEditingController = TextEditingController();
  TextEditingController passwordtextEditingController = TextEditingController();

  late UserCredential userCredential;
  bool loading = false;

  Future loginAuth() async {
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailtextEditingController.text,
        password: passwordtextEditingController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    setState(() {
      loading = false;
    });
    // ignore: unnecessary_null_comparison
    if (userCredential != null) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => home()));
    }
    else{
      print("Invalid Credentials");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, //side
              children: [
                SizedBox(
                  height: 35.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, right: 0.0, left: 20.0, bottom: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 240.0,
                        width: 240.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/chef.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 0.0, right: 20.0, left: 20.0, bottom: 0.0),
                    child: Column(
                      children: [
                        Text(
                          "Welcome",
                          style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(top: 20.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 18.0,
                              ),
                              Container(
                                height: 45.0,
                                width: MediaQuery.of(context).size.width / 1.2,
                                padding: EdgeInsets.only(
                                    top: 0.0,
                                    bottom: 0.0,
                                    left: 16.0,
                                    right: 16.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12, blurRadius: 5.0)
                                  ],
                                  color: Color(
                                    getColorHexFromStr('#fff5ea'),
                                  ),
                                ),
                                child: TextField(
                                  controller: emailtextEditingController,
                                  cursorColor: Colors.black87,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(
                                        Icons.email,
                                        color: Colors.black,
                                      ),
                                      hintText: 'Email Id',
                                      hintStyle: TextStyle(
                                          color: Colors.black,
                                          fontStyle: FontStyle.normal)),
                                ),
                              ),
                              SizedBox(
                                height: 18.0,
                              ),
                              Container(
                                height: 45.0,
                                width: MediaQuery.of(context).size.width / 1.2,
                                padding: EdgeInsets.only(
                                    top: 0.0,
                                    bottom: 0.0,
                                    left: 16.0,
                                    right: 16.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12, blurRadius: 5.0)
                                  ],
                                  color: Color(
                                    getColorHexFromStr('#fff5ea'),
                                  ),
                                ),
                                child: TextField(
                                  controller: passwordtextEditingController,
                                  obscureText: true,
                                  cursorColor: Colors.black87,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(
                                        Icons.password,
                                        color: Colors.black,
                                      ),
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                          color: Colors.black,
                                          fontStyle: FontStyle.normal)),
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              loading
                                  ? CircularProgressIndicator()
                                  : Container(
                                      padding: EdgeInsets.only(
                                          top: 0.0,
                                          bottom: 16.0,
                                          left: 16.0,
                                          right: 16.0),
                                      width: double.infinity,
                                      child: RaisedButton(
                                        elevation: 5.0,
                                        padding: EdgeInsets.all(16.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        color: Colors.orangeAccent,
                                        onPressed: () {
                                          if (!emailtextEditingController.text
                                              .contains("@")) {
                                            displayToastMessage(
                                                "Email id is invalid", context);
                                          } else if (passwordtextEditingController
                                              .text.isEmpty) {
                                            displayToastMessage(
                                                "Password is mandatory",
                                                context);
                                          } else {
                                            loginAuth();
                                            setState(() {
                                              loading = true;
                                            });
                                          }
                                        },
                                        child: Text(
                                          "Login".toUpperCase(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                              Padding(
                                  padding: EdgeInsets.only(top: 20.0),
                                  child: RichText(
                                      text: TextSpan(
                                    text: 'Do not have an acount  ? ',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Register Here ',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.red),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        register()));
                                          },
                                      ),
                                    ],
                                  )))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}
