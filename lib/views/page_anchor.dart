import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roomreserve/controllers/user_controller.dart';
import 'package:roomreserve/helpers/data_fetcher.dart';
import 'package:roomreserve/utils/colors.dart';
import 'package:roomreserve/views/dashboard/dashboard.dart';
import 'package:roomreserve/views/discover/rooms.dart';
import 'package:roomreserve/views/profile/profile.dart';
import 'package:roomreserve/views/reservation/reserved.dart';
import 'package:roomreserve/views/search/search.dart';
import 'package:get/get.dart';
import 'package:roomreserve/views/signin/sign_in.dart';

import '../components/drawer_tile.dart';
import '../components/kalubtn.dart';


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
        fontSize: 12,
      ),
    ),
    TabItem(
      Icons.layers,
      "Lodges",
      Karas.action,
      labelStyle: TextStyle(
        color: Colors.white,
        fontSize: 12,
      ),
    ),
    TabItem(
      Icons.person,
      "Account",
      Karas.action,
      labelStyle: TextStyle(
        color: Colors.white,
        fontSize: 12,
      ),
    ),
  ]);

  CircularBottomNavigationController _controller = CircularBottomNavigationController(0);
  PageController _pageController = PageController();

  DataFetcher _dataFetcher = DataFetcher();

  UserController _userController = Get.find();

  @override
  void initState(){
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Karas.primary,
      systemNavigationBarIconBrightness: Brightness.light,
    ));

    _dataFetcher.fetchLodges();
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
        selectedCallback: (index) {
          _pageController.animateToPage(
            index!,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        },
      ),
      drawer: Container(
        width: MediaQuery.of(context).size.width - 60,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(18),
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF06435A),
                    Color(0xFF0C729B),
                  ],
                  stops: [0.5, 1],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/avatar.webp'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '${_userController.user.first.fullname}',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    '${_userController.user.first.email}',
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    DrawerTile(
                      title: 'Rooms',
                      icon: Icons.meeting_room_outlined,
                      onclick: (){

                      },
                    ),
                    DrawerTile(
                      title: 'Reserved',
                      icon: Icons.warehouse,
                      onclick: (){
                        Get.to(()=>Reserved());
                      },
                    ),
                    Spacer(),
                    Divider(),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        Kalubtn(
                            width: 100,
                            label: 'Logout', onclick: (){
                          Get.offAll(()=>SignIn());
                        }),
                      ],
                    ),
                    SizedBox(height: 20,)

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          _controller.value = index;
        },
        children: [
          Dashboard(),
          Reserved(),
          Profile(),
        ],
      ),
    );
  }
}

