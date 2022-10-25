import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../Model/NewsModel.dart';

class NewsProvider extends ChangeNotifier{
  List<NewsModel> list = [];
  void getList() async {
    String apiURL = "https://newsapi.org/v2/everything?q=apple&from=2022-10-10&to=2022-10-10&sortBy=popularity&apiKey=ce90c7a0997143fab8c30142e2edcb1e";
    var client = http.Client();
    var jsonString = await client.get(Uri.parse(apiURL));
    var jsonObject = jsonDecode(jsonString.body);
    var newsListObject = jsonObject['articles'] as List;
    list = newsListObject.map((e) {
      return NewsModel.fromJson(e);
    }).toList();
    notifyListeners();
  }
}