import 'package:flutter/material.dart';

class GenreSlider extends StatefulWidget {
  const GenreSlider({Key? key}) : super(key: key);

  @override
  State<GenreSlider> createState() => _GenreSliderState();
}

class _GenreSliderState extends State<GenreSlider> {
  
  List<String> _list = [
    'Game',
    'Music',
    'Entertainment',
    'University',
    'Travel',
  ];
  String genreSelected = '';
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ..._list.map((e) {
              return InkWell(
                onTap: () {
                  setState(() {
                    genreSelected = e;
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                  color: (genreSelected == e?Colors.white: Colors.grey),
                  border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Text(e, style: TextStyle(
                    color: (genreSelected == e?Colors.black: Colors.white),
                    fontSize: 20
                ),
                 )
                )
              );
            })
          ],
        ),
      ),
    );
  }
}
