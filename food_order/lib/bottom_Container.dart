import 'package:flutter/material.dart';
class BottomContainer extends StatelessWidget{
  final String image;
  final String name;
  final int price;
  BottomContainer({required this. image, required this. name, required this. price});
  @override
 Widget build(BuildContext context){
    return Container(
      height: 250,
      width: 200,
      decoration: BoxDecoration(
        color: Color(getColorHexFromStr('#fdebba')),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(image),
          ),
          ListTile(
            leading: Text(
              name,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black87,
              ),
            ),
            trailing: Text(
              "\₹ $price",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: List.generate(
                5,
                    (index) => Icon(
                  Icons.star,
                  size: 20.0,
                  color: Colors.deepOrange,
                ),
              ),
            ),
          )
        ],
      ),
    );
}
}
