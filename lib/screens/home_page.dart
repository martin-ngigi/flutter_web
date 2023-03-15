import 'package:flutter_web/widgets/bottom_bar.dart';
import 'package:flutter_web/widgets/carousel.dart';
import 'package:flutter_web/widgets/featured_heading.dart';
import 'package:flutter_web/widgets/featured_tiles.dart';
import 'package:flutter_web/widgets/floating_quick_access_bar.dart';
import 'package:flutter_web/widgets/main_heading.dart';
import 'package:flutter_web/widgets/menu_drawer.dart';
import 'package:flutter_web/widgets/top_bar_contents.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      extendBodyBehindAppBar: true,//set body behind app bar
      //anything less than 800 px width, then its a mobile device.
      //if the screensize is less than 800, show AppBar, else show Preferred size
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
      drawer: MenuDrawer(),//only visible on mobile phones... ie on devices that have a width of less than 800
      body: SingleChildScrollView(
        controller: _scrollController,//fixed top nav menu
        child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    child: SizedBox(
                      height: screenSize.height * 0.65,
                      width: screenSize.width,
                      child: Image.asset(
                        'assets/images/background.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      FloatingQuickAccessBar(
                        screenSize: screenSize,

                      ),
                      FeaturedHeading(screenSize: screenSize),
                      FeaturedTiles(screenSize: screenSize),
                      MainHeading(screenSize: screenSize),
                      MainCarousel(),
                      SizedBox(height: screenSize.height/10,),
                      //Bottom Bar
                      BottomBar(),
                    ],
                  ),

                ],
              ),

            ],
          ),
      ),

    );
  }
}
