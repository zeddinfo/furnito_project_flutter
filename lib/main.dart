import 'package:flutter/material.dart';
import 'package:furnito_chart/pages/cart_page.dart';
import 'package:furnito_chart/pages/detail_chat.dart';
import 'package:furnito_chart/pages/home/main_page.dart';
import 'package:furnito_chart/pages/product_page.dart';
import 'package:furnito_chart/pages/sign_in_page.dart';
import 'package:furnito_chart/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Furtino App',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        '/sign-in': (context) => SignInPage(),
        '/home': (context) => MainPage(),
        '/detail-chat': (context) => DetailChat(),
        '/product': (context) => ProductPage(),
        '/cart': (context) => CartPage(),
      },
    );
  }
}
