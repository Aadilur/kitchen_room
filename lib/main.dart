import 'package:flutter/material.dart';
import 'package:kitchen_room_world/pages/home_page.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: "Poppins"
      ),
      routes: {
        "/":(context) => OnBoardingPage(),
        Routes.homePageRoute:(context) => HomePage(),
      },
    );
  }
}

