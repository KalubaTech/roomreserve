import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:roomreserve/components/kalubtn.dart';
import 'package:roomreserve/components/kalutext.dart';
import 'package:roomreserve/utils/colors.dart';
import 'package:roomreserve/views/onboarding/sign_up.dart';
import 'package:get/get.dart';

import '../../utils/font_sizes.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  var isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Karas.primary,
      appBar: AppBar(
        backgroundColor: Karas.primary,
        leading: Container(
          padding: EdgeInsets.all(10),
          child: InkWell(
            child: IconButton(
                onPressed: (){
                  
                },
                style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Karas.secondary)),
                icon: Icon(Icons.chevron_left, color: Karas.background,size: 16,)
            ),
          ),
        ),
        foregroundColor: Colors.white,
        title: Text(
          'Sign In',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 20,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                decoration: BoxDecoration(
                  color: Karas.background,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40)),
                ),
                child: ListView(
                 shrinkWrap: true,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Welcome!', style: TextStyle(fontSize: FontSizes.heading, fontWeight: FontWeight.bold),),
                          SizedBox(height: 4,),
                          Text('Sign in your account to continue', style: TextStyle(fontSize: FontSizes.details, color: Karas.secondary.withOpacity(0.6)),),
                        ],
                      ),
                    ),
                    SizedBox(height: 40,),
                    Container(
                      child: Column(

                        children: [
                          Kalutext(
                              labelText: '   Email Address',
                              hintText: 'Email address',
                              borderRadius: BorderRadius.circular(40),
                              controller: _emailController
                          ),
                          SizedBox(height: 20,),
                          Kalutext(
                              labelText: '   Password',
                              hintText: 'Password',
                              borderRadius: BorderRadius.circular(40),
                              controller: _passwordController,
                              isObscured: true,
                              showEye: true,
                          ),
                          SizedBox(height: 60,),
                          Obx(
                                ()=> isLoading.value?
                            Container(
                              width: 40,
                              child: LoadingIndicator(
                                  indicatorType: Indicator.ballRotate, /// Required, The loading type of the widget
                                  colors: [Karas.primary, Karas.action, Colors.green],       /// Optional, The color collections
                                  strokeWidth: 2,                     /// Optional, The stroke of the line, only applicable to widget which contains line
                                  backgroundColor:Colors.transparent,      /// Optional, Background of the widget
                                  pathBackgroundColor: Colors.black   /// Optional, the stroke backgroundColor
                              ),
                            ):Kalubtn(
                              backgroundColor: Karas.action,
                              label: 'Sign In',
                              height: 45,
                              borderRadius: 40,
                              onclick: (){
                                isLoading.value = true;
                              },
                            ),
                          ),
                          SizedBox(height: 30,),
                          Text("Don't have an account?", textAlign: TextAlign.center,),
                          SizedBox(height: 30,),
                          Kalubtn(
                            backgroundColor: Colors.transparent,
                            label: 'Sign Up',
                            height: 45,
                            borderRadius: 40,
                            onclick: (){
                              Get.to(()=>SignUp());
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
