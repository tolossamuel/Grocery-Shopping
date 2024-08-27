


import 'package:flutter/material.dart';


class ImageCart extends StatelessWidget {
  final String imageUrl;
  final double width;

  const ImageCart({
    super.key,
    required this.imageUrl,
   
    required this.width
    });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}