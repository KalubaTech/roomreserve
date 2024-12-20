import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roomreserve/rooms/view_room.dart';
import 'package:roomreserve/utils/colors.dart';

import '../lodges/view_loadge.dart';
import '../models/lodge_model.dart';


class HomeCategoryContainer extends StatelessWidget {
  LodgeModel lodgeModel;
  HomeCategoryContainer({required this.lodgeModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Get.to(()=>ViewLodge(lodge: lodgeModel,)),
      child: Container(
        width: 80,
        decoration: BoxDecoration(
          color: Colors.pinkAccent.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
               fit: BoxFit.cover,
              image: AssetImage('assets/lodge1.jpg')
          )
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal:5,vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black54.withOpacity(0.5),
          ),
          child: Column(
            children: [
              CircleAvatar(
                child: Icon(Icons.home_filled, color: Karas.primary,),
              ),
              Spacer(),
              StreamBuilder(
                stream: FirebaseFirestore.instance.collection('rooms').where('lodgeID', isEqualTo: lodgeModel.uid).snapshots(),
                builder: (context,snapshot) {
                  return snapshot.hasData?Text('${snapshot.data!.docs.length}', style: GoogleFonts.agbalumo(fontSize: 20, color: Colors.white),):Text('0', style: GoogleFonts.agbalumo(fontSize: 20, color: Colors.white),);
                }
              ),
              Text('Rooms', style: GoogleFonts.agbalumo(fontSize: 10, color: Colors.white),),
              SizedBox(height: 4,),
              Text('${lodgeModel.name}', style: TextStyle(fontSize: 11, color: Colors.white), overflow: TextOverflow.ellipsis,),
            ],
          ),
        ),
      ),
    );
  }
}
