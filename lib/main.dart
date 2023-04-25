import 'package:flutter/material.dart';
import 'package:flutter_web/screens/about_page.dart';
import 'package:flutter_web/screens/page_not_found.dart';

import 'screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      initialRoute: '/',
      routes: {
        '/' : (context) => HomePage(),
        '/about' : (context) => AboutPage()
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) => PageNotFound());
      },
    );
  }
}
