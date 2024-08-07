import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roomreserve/utils/colors.dart';
import 'package:roomreserve/views/dashboard/dashboard.dart';


class PageAnchor extends StatefulWidget {
  PageAnchor({super.key});

  @override
  State<PageAnchor> createState() => _PageAnchorState();
}

class _PageAnchorState extends State<PageAnchor> {
  List<TabItem> tabItems = List.of([
    TabItem(
        Icons.home,
        "Home",
        Karas.action,
        labelStyle: TextStyle(
            color: Colors.white,
            fontSize: 12
        )
    ),
    TabItem(
        Icons.search,
        "Search",
        Karas.action,
        labelStyle: TextStyle(
            color: Colors.white,
            fontSize: 12
        )
    ),
    TabItem(
        Icons.layers,
        "Rooms",
        Karas.action,
        labelStyle: TextStyle(
            color: Colors.white,
            fontSize: 12
        )
    ),
    TabItem(
        Icons.person,
        "Account",
        Karas.action,
        labelStyle: TextStyle(
          color: Colors.white,
            fontSize: 12
        )
    ),
  ]);

  CircularBottomNavigationController _controller = CircularBottomNavigationController(0);
  PageController _pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Karas.primary, // Set your desired color here
      systemNavigationBarIconBrightness: Brightness.light, // Set icon brightness for better contrast
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CircularBottomNavigation(
        tabItems,
        barBackgroundColor: Karas.primary,
        iconsSize: 24,
        circleSize: 50,
        controller: _controller,
        selectedCallback: (index){
          _pageController.jumpToPage(index!);
        },
      ),
      body: PageView(
        controller: _pageController,
        children: [
          Dashboard(),
          Container(),
          Container(),
          Container(),
        ],
      ),
    );
  }
}
