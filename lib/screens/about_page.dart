//stfull
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/top_bar_contents.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return Scaffold(
      appBar: screenSize.width<800?AppBar(
        iconTheme: IconThemeData(color: Colors.blue),//change the color of icons, inclussive of the drawer icon.
        backgroundColor: Colors.white.withOpacity(_opacity),
        elevation: 0,
        title: Text(
          'Author',
          style: TextStyle(
            color: Color(0xFF077bd7),
            fontSize: 26,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w900,
            letterSpacing: 3,
          ),
        ),
      ): PreferredSize(
        preferredSize: Size(screenSize.width, 70),
        child: TopBarContents(_opacity),
      ),

      body: Center(child: Text("About")),
    );
  }
}
