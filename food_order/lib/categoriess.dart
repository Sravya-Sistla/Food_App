import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_order/food_categories_modle.dart';

import 'bottom_Container.dart';
class Categoriess extends StatelessWidget {
  List<FoodCategoriesModle> list=[];
  Categoriess({@required this.list});
  @override
  Widget build(BuildContext context){

    return  Scaffold(
      body: GridView.count(
        shrinkWrap: false,
        primary: false,
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: list
              .map(
              (e) => BottomContainer(
              image: e.image,
              name: e.name,
              price: e.price,
              ),
        )
            .toList()
    )
    );
  }
}