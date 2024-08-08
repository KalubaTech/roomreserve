import 'package:chip_list/chip_list.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timeline_calendar/timeline/model/calendar_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/day_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/headers_options.dart';
import 'package:flutter_timeline_calendar/timeline/utils/calendar_types.dart';
import 'package:flutter_timeline_calendar/timeline/widget/timeline_calendar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roomreserve/components/home_category_container.dart';
import 'package:roomreserve/components/kalubtn.dart';
import 'package:roomreserve/utils/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class ViewRoom extends StatelessWidget {
 ViewRoom({super.key});

 PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return DraggableHome(
        title: Container(),
        leading: IconButton(
            onPressed: (){
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios,size: 12,),
          color: Karas.primary,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.white60)
          ),
        ),
        alwaysShowLeadingAndAction: true,
        actions: [
          IconButton(
              onPressed: (){},
            icon: Icon(Icons.favorite,size: 16,),
            color: Colors.red,
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.white60)
            ),
          )
        ],
        headerExpandedHeight: 0.4,
        headerWidget: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/noimage.png')
            )
          ),
          child: Stack(
            children: [
              PageView(
                controller: _controller,
                children: [
                  Image.asset('assets/lodge1.jpg', fit: BoxFit.cover,),
                  Image.asset('assets/lodge1.jpg', fit: BoxFit.cover,),
                ],
              ),
              Positioned(
                bottom: 40,
                  child: Container(
                    width: Get.width,
                    child: Center(
                      child: SmoothPageIndicator(
                          controller: _controller,  // PageController
                          count:  2,
                          effect:  JumpingDotEffect(
                            activeDotColor: Karas.action,
                            dotHeight: 6,
                            dotWidth: 18,
                            verticalOffset: 8
                          ),  // your preferred effect
                          onDotClicked: (index){
                          }
                      ),
                    ),
                  )
              )
            ],
          ),
        ),
        body: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Room 20 West Side', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange,), 
                    SizedBox(width: 10,),
                    Text('4.9 (116 reviews)', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
                  ],
                ),
                SizedBox(height: 16,),
                Row(
                  children: [
                    Text('K250', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
                    Text('  per night', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),),
                  ],
                ),
                SizedBox(height: 10,),
                Divider(),
                SizedBox(height: 10,),
                Text('Amenities', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
                ChipList(
                  shouldWrap: true,
                  chipListDisabled: true,
                  style: TextStyle(fontSize: 12),
                  inactiveTextColorList: [Karas.primary],
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                  widgetSpacing: 2,
                  listOfChipNames: ['Wi-fi',"65' HDTV", 'Hair Dryer','Washing machine','Dishwasher', 'Air conditioner'],
                  listOfChipIndicesCurrentlySelected: [],
                  showCheckmark: false,
                ),
                SizedBox(height: 10,),
                Divider(),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Foxdale Lodge', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
                        Text('30 rooms', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.grey),),
                      ],
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/roomreservelogo_nolabel.png'),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                GridView(
                     physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, ),
                    children: [
                      Card(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage('assets/lodge1.jpg'),
                                fit: BoxFit.cover
                            )
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage('assets/lodge1.jpg'),
                                fit: BoxFit.cover
                            )
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage('assets/lodge1.jpg'),
                                fit: BoxFit.cover
                            )
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage('assets/lodge1.jpg'),
                                fit: BoxFit.cover
                            )
                          ),
                        ),
                      ),

                    ],
                )
              ],
            ),
          ),
           SizedBox(height: 100,),
        ],
      bottomSheet: Container(
        height: 85,
        padding: EdgeInsets.all(10),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Karas.primary,
            borderRadius: BorderRadius.circular(60),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2,
                spreadRadius: 2,

              )
            ]
          ),
          child: Row(
            children: [
              Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                      onTap: (){
                        Get.bottomSheet(
                          Container(
                            height: MediaQuery.of(context).size.width-40,
                            margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [BoxShadow(color: Colors.black54, spreadRadius: 1, blurRadius: 1)]
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                              child: Column(
                                children: [
                                  TimelineCalendar(
                                    calendarType: CalendarType.GREGORIAN,
                                    calendarLanguage: "en",
                                    calendarOptions: CalendarOptions(
                                      viewType: ViewType.DAILY,
                                      toggleViewType: true,
                                      headerMonthElevation: 10,
                                      headerMonthShadowColor: Colors.black26,
                                      headerMonthBackColor: Colors.transparent,
                                    ),
                                    dayOptions: DayOptions(
                                        compactMode: true,
                                        weekDaySelectedColor: Karas.primary,
                                        disableDaysBeforeNow: true),
                                    headerOptions: HeaderOptions(
                                        weekDayStringType: WeekDayStringTypes.SHORT,
                                        monthStringType: MonthStringTypes.FULL,
                                        backgroundColor: Karas.primary,
                                        resetDateColor: Colors.white,
                                        calendarIconColor: Colors.white,
                                        headerTextColor: Colors.white),
                                    onChangeDateTime: (datetime) {
                                      print(datetime.getDate());
                                    },
                                  ),
                                  Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                                        child: Column(
                                          children: [
                                            Text('Added Days'),
                                            Container(
                                              height: 60,
                                              width: double.infinity,
                                              child: ListView(
                                                scrollDirection: Axis.horizontal,
                                                shrinkWrap: true,
                                                children: [
                                                  Chip(
                                                    label: Text('20 Aug'),
                                                    onDeleted: (){},
                                                    padding: EdgeInsets.symmetric(horizontal: 0),
                                                    deleteIcon: Icon(Icons.cancel),
                                                    deleteIconColor: Colors.red,
                                                  ),
                                                  SizedBox(width: 10,),
                                                  Chip(
                                                    label: Text('20 Aug'),
                                                    onDeleted: (){},
                                                    padding: EdgeInsets.symmetric(horizontal: 0),
                                                    deleteIcon: Icon(Icons.cancel),
                                                    deleteIconColor: Colors.red,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                    child: Kalubtn(
                                      backgroundColor: Karas.action,
                                      width: MediaQuery.of(context).size.width-40,
                                        label: 'K2,000 - Done',
                                        borderRadius: 40,
                                        height: 45,
                                        onclick: (){
                                          Get.back();
                                        }),
                                  ),
                                  SizedBox(height: 20,)
                                ],
                              ),
                            ),
                          )
                        ); 
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('18 - 21 Oct - 3 nights', style: TextStyle(fontSize: 10, color: Colors.white70),),
                          Text('K1,250', style: GoogleFonts.alata(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white
                          ),),
                        ],
                      ),
                    ),
                  )
              ),
              Kalubtn(
                backgroundColor: Colors.white,
                labelStyle: TextStyle(color: Karas.primary, fontWeight: FontWeight.bold),
                borderRadius: 40,
                 height: 45,
                 width: 100,
                  label: 'Book now',
                  onclick: (){}
              )
            ],
          ),
        ),
      ),
    );
  }
}
