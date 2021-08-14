import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'login.dart';
import '../main.dart';

class register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _registerState();
}

class _registerState extends State<register> {

  bool loading = false;
  int getColorHexFromStr(String colorStr) {
    colorStr = 'FF' + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("color converting error");
      }
    }
    return val;
  }

  late UserCredential userCredential;

  TextEditingController nametextEditingController = TextEditingController();
  TextEditingController emailtextEditingController = TextEditingController();
  TextEditingController phonetextEditingController = TextEditingController();
  TextEditingController passwordtextEditingController = TextEditingController();
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  Future sendData(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailtextEditingController.text,
        password: passwordtextEditingController.text,
      );
      await FirebaseFirestore.instance
          .collection('UserData')
          .doc(userCredential.user!.uid)
          .set({
        "name": nametextEditingController.text.trim(),
        "phone": phonetextEditingController.text.trim(),
        "email": emailtextEditingController.text,
        "password": passwordtextEditingController.text,
        "userid": userCredential.user!.uid,
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    setState(() {
      loading=false;
    });
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
            child:  Column(
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
                          "SignUp",
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
                                  controller: nametextEditingController,
                                  cursorColor: Colors.black87,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(
                                        Icons.person,
                                        color: Colors.black,
                                      ),
                                      hintText: 'Full Name',
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
                                  controller: phonetextEditingController,
                                  cursorColor: Colors.black87,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(
                                        Icons.phone,
                                        color: Colors.black,
                                      ),
                                      hintText: 'Phone Number',
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
                              loading?CircularProgressIndicator():Container(
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
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  color: Colors.orangeAccent,
                                  onPressed: () {
                                    if (nametextEditingController.text.length <
                                        4 || nametextEditingController.text.trim() == null) {
                                      displayToastMessage(
                                          "Name must be atleast 3 Characters",
                                          context);
                                    } else if (!emailtextEditingController.text
                                        .contains("@") || emailtextEditingController.text.trim() == null) {
                                      displayToastMessage(
                                          "Email id is invalid", context);
                                    } else if (phonetextEditingController
                                        .text.isEmpty || phonetextEditingController.text.trim() == null) {
                                      displayToastMessage(
                                          "Phone Number is invalid", context);
                                    } else if (passwordtextEditingController
                                            .text.length <
                                        5 || passwordtextEditingController.text.trim() == null) {
                                      displayToastMessage(
                                          "Password must be atleast 5 Characters ",
                                          context);
                                    } else {
                                      setState(() {
                                        loading=true;
                                      });
                                      sendData(context);
                                    }
                                  },
                                  child: Text(
                                    "Sign Up".toUpperCase(),
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
                                    text: 'Already have an account ? ',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Login Here ',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.red),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        login()));
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
