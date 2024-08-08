import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roomreserve/components/home_category_container.dart';
import 'package:roomreserve/components/section_container.dart';
import 'package:roomreserve/utils/colors.dart';

import '../../components/search_mock.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableHome(
        appBarColor: Karas.primary,
        alwaysShowLeadingAndAction: true,
        alwaysShowTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.menu, color: Colors.white,))
        ],
        title: Container(
          child: Row(
            children: [
              CircleAvatar(
                child: Image.asset('assets/avatar.webp'),
                backgroundImage: AssetImage('assets/avatar.webp'),
              ),
              SizedBox(width: 16,),
              Text('RoomReserve', style: GoogleFonts.agbalumo(fontSize: 18, color: Colors.white),)
            ],
          ),
        ),
        headerExpandedHeight: 0.23,
        headerWidget: Container(
          color: Karas.primary,
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 80,),
              SearchMock()
            ],
          ),
        ),
        body: [
          SectionContainer(
              padding: EdgeInsets.all(20),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_history_outlined, color: Karas.action,),
                        SizedBox(width: 10,),
                        Text('Nearby Lodges', style: GoogleFonts.agbalumo()),
                        Spacer(),
                        Text('View all', style: TextStyle(color: Karas.action, fontSize: 12),)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: double.infinity,
                      height: 120,
                      child: ListView(
                        clipBehavior: Clip.none,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          HomeCategoryContainer(),
                          SizedBox(width: 10,),
                          HomeCategoryContainer(),
                          SizedBox(width: 10,),
                          HomeCategoryContainer(),
                          SizedBox(width: 10,),
                          HomeCategoryContainer(),
                          SizedBox(width: 10,),
                          HomeCategoryContainer(),
                        ],
                      ),
                    )
                  ],
                ),
              )
          ),
          SizedBox(height: 10,),
          SectionContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Suggested', style: GoogleFonts.agbalumo(fontSize: 16),),
                        Text('View all', style: TextStyle(color: Karas.action, fontSize: 12),)
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: GridView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10
                      ),
                      children: [
                        HomeCategoryContainer(),
                        HomeCategoryContainer(),
                        HomeCategoryContainer(),
                        HomeCategoryContainer(),
                      ],
                    ),
                  )
                ],
              )
          )

        ]
    );
  }
}
