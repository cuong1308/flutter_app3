import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Model/ProductModel.dart';
import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier {
  List<ProductModel> list = [];
  void getList() async {
    String apiURL = "https://fakestoreapi.com/products";
    var client = http.Client();
    var jsonString = await client.get(Uri.parse(apiURL));
    var jsonObject = jsonDecode(jsonString.body);
    var newsListObject = jsonObject as List;
    list = newsListObject.map((e) {
      return ProductModel.fromJson(e);
    }).toList();
    notifyListeners();
  }
}