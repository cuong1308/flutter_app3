import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Slide extends StatelessWidget {
  Slide({super.key});

List<String> _list = [
  'assets/images/img1.jpg',
  'assets/images/img2.jpg',
  'assets/images/img3.jpg',
  'assets/images/img4.jpg',
];


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ..._list.map((e) {
              return Container(
                margin: EdgeInsets.all(10),
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(e)
                  )
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}