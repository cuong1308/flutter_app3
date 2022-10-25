import 'package:flutter/material.dart';
import 'package:flutter_app/SignUpPage.dart';
import 'package:flutter_app/provider/NewsProvider.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var newsProvider = Provider.of<NewsProvider>(context);
    newsProvider.getList();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...newsProvider.list.map((e) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(2),
                  child: Column(
                    //Image.network(e.urlToImage??),
                    //Text(e.title??""),
                    //Text(e.descripton??"")
                  ),
                ),
              );
            })
          ],
        ),
      ),

    );
  }
}
