import 'package:chip_list/chip_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timeline_calendar/timeline/model/calendar_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/day_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/headers_options.dart';
import 'package:flutter_timeline_calendar/timeline/utils/calendar_types.dart';
import 'package:flutter_timeline_calendar/timeline/widget/timeline_calendar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_widget/google_maps_widget.dart';
import 'package:roomreserve/components/home_category_container.dart';
import 'package:roomreserve/components/kalubtn.dart';
import 'package:roomreserve/components/kalutext.dart';
import 'package:roomreserve/models/lodge_model.dart';
import 'package:roomreserve/models/room_model.dart';
import 'package:roomreserve/rooms/pending_payment.dart';
import 'package:roomreserve/rooms/view_room.dart';
import 'package:roomreserve/utils/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class ViewLodge extends StatelessWidget {
  LodgeModel lodge;
  ViewLodge({required this.lodge});

 PageController _controller = PageController();
 TextEditingController _phoneNumberController = TextEditingController();

  var _markers = <Marker>{}.obs;

  // Update the marker on the map
  void _updateMarker(LatLng position) {
    _markers.value = {
      Marker(
        markerId: MarkerId("current_location"),
        position: position,
        infoWindow: InfoWindow(title: "${lodge.name}"),
      ),
    };
  }

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
                Text('${lodge.name}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                SizedBox(height: 10,),
                Divider(),
                Text('Phone Number:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
                SizedBox(height: 10,),
                Text('${lodge.phone}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                Divider(),
                Text('Location', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
                SizedBox(height: 10,),
                Container(
                    height: 120,
                    child: Obx(
                      ()=> GoogleMap(
                        myLocationButtonEnabled: true,
                        mapType: MapType.hybrid,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(lodge.latitude, lodge.longitude), // Default to Lusaka, Zambia
                          zoom: 17, // Set an appropriate zoom level
                        ),

                        onMapCreated: (controller) {
                          //_googleMapController = controller;
                          _updateMarker(LatLng(lodge.latitude, lodge.longitude));
                        },
                        onLongPress: (loc) {
                          // _currentLocation.value = LatLng(loc.latitude, loc.longitude);
                           // Update marker when user selects a new location
                        },
                        markers: _markers.value,
                      ),
                    )
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
                        Text('Rooms', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),],
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('rooms').where('lodgeID', isEqualTo: lodge.uid).snapshots(),
                    builder: (context, snapshot) {
                      return snapshot.hasData && snapshot.data!.docs.length>0?GridView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: snapshot.data!.docs.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, ),
                        itemBuilder: (BuildContext context, int index) {
                          RoomModel room = RoomModel(
                              uid: snapshot.data!.docs[index].id,
                              images: snapshot.data!.docs[index].get('images').map<String>((e)=>e.toString()).toList(),
                              amenities: snapshot.data!.docs[index].get('amenities').map<String>((e)=>e.toString()).toList(),
                              lodgeID: snapshot.data!.docs[index].get('lodgeID'), 
                              name: snapshot.data!.docs[index].get('name'),
                              isBooked: snapshot.data!.docs[index].get('isBooked'),
                            price:  snapshot.data!.docs[index].get('price')
                          );

                          return InkWell(
                            onTap: (){
                              Get.to(()=>ViewRoom(room));
                            },
                            child: Column(
                              children: [
                                Expanded(
                                  child: Card(
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
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(room.name,),
                                      Text('K${room.price}',style: TextStyle(fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },

                      ):Container();
                    }
                )
              ],
            ),
          ),
           SizedBox(height: 100,),
        ],

    );
  }
}
