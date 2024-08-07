import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roomreserve/utils/colors.dart';
import 'package:roomreserve/views/page_anchor.dart';
import 'package:roomreserve/views/signin/sign_in.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Room Reserve',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Karas.primary),
        useMaterial3: true,
      ),
      home: PageAnchor() //SignIn()
    );
  }
}