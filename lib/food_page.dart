import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodPage extends StatefulWidget {
   FoodPage({Key? key}) : super(key: key);


  @override
   State<FoodPage> createState() => _FoodPageState();
   }
class _FoodPageState extends State<FoodPage> {
  List<String> list = [
    'assets/images/img1.jpg',
    'assets/images/img2.jpg',
    'assets/images/img3.jpg',
    'assets/images/img4.jpg',
  ];
  bool showGrid = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTitle(context),
              buildWelcome(context),
              buildSeacrch(context),
              buildSavedPlace(context),
              //buildGrid(context)
              //buildList(context),
              showGrid?buildGrid(context):buildList(context),
            ],
          ),
        ),
      ),
    );
  }

  buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        IconButton(onPressed: () {}, icon: Icon(Icons.extension)),
      ],
    );
  }

  buildWelcome(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "Welcome,   ",
        style: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold
        ),
        children: [
          TextSpan(
            text: "Charlie",
            style: TextStyle(
              fontWeight: FontWeight.normal
            )
          )
        ]
      )
    );
  }

  buildSeacrch(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        )
      ),
    );
  }

  buildSavedPlace(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [ Text(
        "Saved Place",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25
        ),
       ),
        Row(
          children: [
            IconButton(onPressed: () {
              setState(() {
                showGrid = true;
              });
            }, icon: Icon(Icons.grid_3x3, size: 30,)),
            IconButton(onPressed: () {
              setState(() {
                showGrid = false;
              });
            }, icon: Icon(Icons.list, size: 35,))
          ],
        )
      ]
    );
  }

  buildGrid(BuildContext context) {
    return Expanded(
      child: GridView.count(
        mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          crossAxisCount: 2,
        children: [
          ...list.map((e) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(e),
                  fit: BoxFit.cover
                )
              ),
            );
          }).toList()
        ],
      ),
    );
  }

  buildList(BuildContext context) {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ...list.map((e) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(e)
                )
              ),
            );
          }).toList()
        ],
      ),
    );
  }
}
