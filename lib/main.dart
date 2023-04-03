import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:kitchen_room_world/pages/home_page.dart';
import 'package:kitchen_room_world/pages/login_page.dart';
import 'package:kitchen_room_world/pages/onboarding_page.dart';
import 'package:kitchen_room_world/utils/routes.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: "Poppins"
      ),
      routes: {
        "/":(context) => Login(),
        Routes.homePageRoute:(context) => HomePage(),
        Routes.loginPage:(context) =>Login(),
        Routes.onboardingPageRoute:(context) =>OnBoardingPage(),
      },
    );
  }
}

