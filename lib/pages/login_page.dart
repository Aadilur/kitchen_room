import 'dart:ui';

import 'package:flutter/material.dart';

import '../components/square_button.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
              // image: DecorationImage(
              //   image: AssetImage("assets/images/login_bg.png"),
              //   fit: BoxFit.fitWidth,
              //   opacity: 1,
              // ),
              ),
          child: Column(
            children: [
              const SizedBox(
                height: 90,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "hurray . . . !",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                    // color: Color.fromRGBO(220, 109, 61, 1.0),
                    color: Colors.deepOrange[300],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0,vertical: 6),
                child: Text(
                  "You are just one step away from \nworld's best food recipes !",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: Colors.green[500],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              Padding(
                  padding: const EdgeInsets.all(40),
                  child: Image.asset("assets/images/im2.png")),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Continue with _",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 3,
                    color: Color.fromRGBO(63, 157, 0, 0.6),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                children: [
                  const Spacer(),
                  const Spacer(),
                  InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    onTap: () {},
                    child: const SquareBtn(
                      imagePath: "assets/images/icons/google_icon.png",
                      borderWidth: 2,
                      color: Color.fromRGBO(232, 232, 232, 0.3),
                      borderRadiusInner: 20,
                      borderRadius: 20,
                      padding: 0,
                      width: 100,
                      height: 100,
                      sigmaX: 5,
                      sigmaY: 5,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    onTap: () {},
                    child: const SquareBtn(
                      imagePath: "assets/images/icons/apple_icon.png",
                      borderWidth: 2,
                      color: Color.fromRGBO(232, 232, 232, 0.2),
                      borderRadiusInner: 20,
                      padding: 0,
                      width: 100,
                      height: 100,
                      sigmaX: 5,
                      sigmaY: 5,
                    ),
                  ),
                  const Spacer(),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 40,
              )
            ],
          ) /* add child content here */,
        ),
      ),
    );
  }
}
