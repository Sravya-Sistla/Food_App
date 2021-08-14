import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'main.dart';

class DetailPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,),onPressed: (){},),
        backgroundColor: Color(getColorHexFromStr('#fbcd7a')),

      ),

      body: Column(
        children: [
          Expanded(child: Container(
            child:CircleAvatar(
              radius:110,
              backgroundImage: AssetImage('assets/burger.png'),
            )
          )),
          Expanded(
              flex: 2,

              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(

                  color: Color(getColorHexFromStr('#fbcd7a')),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight:Radius.circular(10),
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text("Burger",style: TextStyle(fontSize: 40,color: Colors.white),),
                    Row(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Icon(Icons.remove),
                            ),
                            SizedBox(width: 10,),
                            Text("1",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                            SizedBox(width: 10,),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Icon(Icons.add),
                            ),
                          ],
                        ),
                        SizedBox(width: 160,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Rs.119",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)
                          ],
                        ),

                      ],
                    ),
                    Text("Description",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                    Text("A hamburger (also burger for short) is a food, typically considered a sandwich, consisting of one or more cooked patties of ground meat, usually beef, placed inside a sliced bread roll or bun. The patty may be pan fried, grilled, smoked or flame broiled. ... A hamburger topped with cheese is called a cheeseburger.",style: TextStyle(color: Colors.black87),),
                    Container(
                      height: 55,
                      width: double.infinity,
                      color: Color(getColorHexFromStr('#fbcd7a')),
                      child: RaisedButton(onPressed:() {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.shopping_cart,color: Colors.black,),
                            SizedBox(width: 10,),
                            Text("Add to cart",style: TextStyle(fontSize: 20,color: Colors.black),)
                          ],
                        ),
                        ),

                    ),

                  ],
                ),
              )),
        ],
      ),
    );
  }

}