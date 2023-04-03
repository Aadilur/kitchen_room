import 'dart:ui';

import 'package:flutter/material.dart';

class SquareBtn extends StatelessWidget {
  final String imagePath;
  final double imageSize;
  final Color borderColor;
  final Color? color;
  final double borderRadius;
  final double borderRadiusInner;
  final double padding;
  final double imagePadding;
  final double borderWidth;
  final double width;
  final double height;
  final double sigmaX;
  final double sigmaY;

  const SquareBtn({
    Key? key,
    required this.imagePath,
    this.width = 100,
    this.height = 100,
    this.imageSize = 50,
    this.color,
    this.borderColor = Colors.white,
    this.borderRadius = 10,
    this.borderRadiusInner = 6,
    this.borderWidth = 1,
    this.padding = 10,
    this.imagePadding = 10,
    this.sigmaX = 10,
    this.sigmaY = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(borderRadius),
      ),
      child: Container(
        padding: EdgeInsets.all(padding),
        width: width,
        height: height,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(imagePadding),
            decoration: BoxDecoration(
              border: Border.all(color: borderColor, width: borderWidth),
              borderRadius: BorderRadius.circular(borderRadiusInner),
              color: color ?? Colors.grey[200],
            ),
            child: Image.asset(
              imagePath,
              height: imageSize,
            ),
          ),
        ),
      ),
    );
  }
}
