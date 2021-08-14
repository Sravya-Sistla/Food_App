import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_order/categories.dart';
import 'package:food_order/categoriess.dart';
import 'package:food_order/foodModle.dart';
import 'package:food_order/food_categories_modle.dart';
import 'package:food_order/main.dart';
import 'package:food_order/provider.dart';
import 'package:provider/provider.dart';

import 'bottom_Container.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  Widget categoriesContainer({required Function onTap, required String name}) {
    return Column(
      children: [
        GestureDetector(
         OnTap: onTap,
         child: Container(
          margin: EdgeInsets.only(right: 20.0),
          height: 70.0,
          width: 70.0,
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(image)),
              color: Color(getColorHexFromStr("#fde696")),
              borderRadius: BorderRadius.circular(10)),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          name,
          style: TextStyle(fontSize: 15, color: Colors.black87),
        )
      ],
    )
    );
  }

  Widget drawerItem({required String name, @required IconData}) {
    return ListTile(
      leading: Icon(
        IconData,
        color: Colors.black,
      ),
      title: Text(name, style: TextStyle(color: Colors.black)),
    );
  }

  List<CategoriesM> burgerList = [];
  List<CategoriesM> drinksList = [];
  List<CategoriesM> grillList = [];
  List<CategoriesM> momoList = [];
  List<CategoriesM> biriyaniList = [];

  List<FoodModle> singleFoodList = [];
  List<CategoriesM> categoryFoodList = [];
  List<FoodCategoriesModle> burgerCategoriessList = [];

  Widget burger() {
    return Row(
        children: burgerList
            .map((e) => categoriesContainer(
            image: e.image,
            name: e.name,
            onTap: (){
               Navigator.of(context).pushReplacement(
                   MaterialPageRoute(
                       builder:(context)=>Categoriess(
                         list: burgerCategoriessList,
                       )));
            }
                       ))
            .toList()
    );
  }
  Widget drinks() {
    return Row(
        children: drinksList
            .map((e) => categoriesContainer(
            image: e.image,
            name: e.name,
            onTap: (){}))
            .toList()
    );
  }
  Widget grill() {
    return Row(
        children: grillList
            .map((e) => categoriesContainer(image: e.image, name: e.name))
            .toList()
    );
  }
  Widget momo() {
    return Row(
        children: momoList
            .map((e) => categoriesContainer(image: e.image, name: e.name))
            .toList()
    );
  }
  Widget biriyani() {
    return Row(
        children: biriyaniList
            .map((e) => categoriesContainer(image: e.image, name: e.name))
            .toList()
    );
  }




  @override
  Widget build(BuildContext context) {
    Myprovider provider = Provider.of<Myprovider>(context);


    provider.getCategory();
    categoryFoodList= provider.throwCategoryList;
    //single//
    provider.getBurgerCategoriessList();
    burgerCategoriessList = provider.throwBurgerCategoriessList;

    provider.getFoodList();
    singleFoodList= provider.throwFoodModleList;
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Color(getColorHexFromStr('#fbcd7a')),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/image.png'),
                    )),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage('assets/profile.png'),
                    ),
                    accountName: Text(
                      "Anushika Bala",
                      style: TextStyle(color: Colors.black),
                    ),
                    accountEmail: Text(
                      "Anushikabala@gmail.com",
                      style: TextStyle(color: Colors.black),
                    )),
                drawerItem(name: "Profile", IconData: Icons.person),
                drawerItem(name: "Cart", IconData: Icons.add_shopping_cart),
                drawerItem(name: "Order", IconData: Icons.shop),
                drawerItem(name: "About", IconData: Icons.announcement_rounded),
                drawerItem(name: "About", IconData: Icons.person),
                Divider(
                  thickness: 2,
                  color: Colors.black,
                ),
                ListTile(
                  leading: Text("Communicate",
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                ),
                drawerItem(name: "Change", IconData: Icons.lock),
                drawerItem(name: "Logout", IconData: Icons.exit_to_app),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child:
                CircleAvatar(backgroundImage: AssetImage('assets/profile.png')),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 10.0,
              ),
              TextField(
                  decoration: InputDecoration(
                hintText: "Search Food",
                hintStyle: TextStyle(color: Colors.black54),
                prefixIcon: Icon(Icons.search, color: Colors.black54),
                filled: true,
                fillColor: Colors.white70,
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.orangeAccent, width: 3.0),
                    borderRadius: BorderRadius.circular(10)),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.orangeAccent, width: 3.0),
                    borderRadius: BorderRadius.circular(10)),
              )),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: categoryFoodList.map(
                          (e) => categoriesContainer(
                          image: e.image,
                          name: e.name,),
                    ).toList(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 510,
                child: GridView.count(
                  shrinkWrap: false,
                  primary: false,
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: singleFoodList.map(
                          (e) => BottomContainer(
                              image: e.image,
                              name: e.name,
                              price: e.price),
                  ).toList()

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
