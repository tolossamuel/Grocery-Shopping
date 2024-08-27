


import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextWidget extends StatelessWidget {
  final String text;
  final Color fontColor;
  final int fontSizes;
  final String fontFamily;
  FontWeight? fontWeight = FontWeight.normal;
  TextWidget({
    super.key,
    required this.text,
    required this.fontColor,
    required this.fontSizes,
    this.fontWeight,
    this.fontFamily = 'Popins',
    });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
    
      style: TextStyle(
        color: fontColor,
        fontSize: fontSizes.toDouble(),
        fontWeight: fontWeight,
        fontFamily: fontFamily,
       
      ),

    );
  }
}