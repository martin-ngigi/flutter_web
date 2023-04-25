import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageNotFound extends StatefulWidget {
  const PageNotFound({Key? key}) : super(key: key);

  @override
  State<PageNotFound> createState() => _PageNotFoundState();
}

class _PageNotFoundState extends State<PageNotFound> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text("My custom 404 Page")),
          Center(child: Text("Page not found..."))
        ],
      ),
    );
  }
}
