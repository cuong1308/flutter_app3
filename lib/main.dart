import 'package:flutter/material.dart';
import 'package:flutter_app/LogInPage.dart';
import 'package:flutter_app/NewsPage.dart';
import 'package:flutter_app/destination.dart';
import 'package:flutter_app/food_menu.dart';
import 'package:flutter_app/food_page.dart';
import 'package:flutter_app/log_in.dart';
import 'package:flutter_app/provider/CartProvider.dart';
import 'package:flutter_app/provider/NewsProvider.dart';
import 'package:flutter_app/provider/ProductProvider.dart';
import 'package:flutter_app/show.dart';
import 'package:flutter_app/slide.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=> ProductProvider()),
          ChangeNotifierProvider(create: (context)=> CartProvider())
        ],
        child: MaterialApp(
          home: ShowProduct(),
        ),
      ));
}


