import 'package:flutter/material.dart';
import 'package:roomreserve/components/kalubtn.dart';
import 'package:roomreserve/utils/colors.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Karas.primary,
        foregroundColor: Colors.white,
        title: Text('Profile'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.settings))
        ],
      ),
      body: Column(
        children: [
          Container(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Karas.primary,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100), bottomRight: Radius.circular(100))
                  ),
                ),
                Positioned(
                   bottom: -50,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: Center(
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(80),
                            image: DecorationImage(image: AssetImage('assets/avatar.webp')),
                            border: Border.all(width: 4, color: Colors.white),
                            boxShadow: [
                              BoxShadow()
                            ]
                          ),
                        ),
                      ),
                    )
                ),

              ],
            ),
          ),
          SizedBox(height: 60,),
          Container(
            child: Column(
              children: [
                Text('Kaluba Chakanga', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                Text('Client', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.email, size: 14,),
                    SizedBox(width: 10,),
                    Text('Email', style: TextStyle(fontSize: 10),),
                  ],
                ),
                Text('kalubachakanga@gmail.com'),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.phone_android, size: 14,),
                    SizedBox(width: 10,),
                    Text('Phone Number', style: TextStyle(fontSize: 10),),
                  ],
                ),
                Text('0962407441'),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.phone_android, size: 14,),
                    SizedBox(width: 10,),
                    Text('Website', style: TextStyle(fontSize: 10),),
                  ],
                ),
                Text('kangaroo.darth.cloud'),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.password, size: 14,),
                    SizedBox(width: 10,),
                    Text('Password', style: TextStyle(fontSize: 10),),
                  ],
                ),
                Text('kangaroo.darth.cloud'),
              ],
            ),
          ),
          Spacer(),
          Container(
             padding: EdgeInsets.all(40),
              child: Kalubtn(
                  label: 'Log out',
                  onclick: (){},
                  backgroundColor: Karas.action,
                  height: 45,
                borderRadius: 40,
              )
          )
        ],
      ),
    );
  }
}
