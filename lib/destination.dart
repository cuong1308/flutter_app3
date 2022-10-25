import 'package:flutter/material.dart';
import 'package:flutter_app/genre_slider.dart';
import 'package:flutter_app/slide.dart';

class destination extends StatelessWidget {
  const destination({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Slide(),
            blockImage(),
            blockTitle(),
            blockActionButton(),
            GenreSlider(),
            blockContext()
          ],
        ),
      ),
    );
  }

  blockImage() => Image.network("https://images.unsplash.com/photo-1663053265496-b6dd33f2a986?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=890&q=80");

  blockTitle() {
    return Container(
      margin: EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Oeschinen Lake Campground",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "Kandersteg, Sưitzerland",
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(100, 0, 0, 0),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.red,
              ),
              Text("48")
            ],
          )
        ],
      ),
    );
  }

  blockActionButton() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Icon(
                Icons.call,
                color: Colors.blue,
              ),
              Text(
                "CALL",
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.send,
                color: Colors.blue,
              ),
              Text(
                "ROUTE",
                style: TextStyle(color: Colors.blue),
              )
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.share,
                color: Colors.blue,
              ),
              Text(
                "SHARE",
                style: TextStyle(color: Colors.blue),
              )
            ],
          ),
        ],
      ),
    );
  }

  blockContext() {
    return Container(
      margin: EdgeInsets.all(30),
      child: Text(
          "jkdajskdh ưuhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh"),
    );
  }
}