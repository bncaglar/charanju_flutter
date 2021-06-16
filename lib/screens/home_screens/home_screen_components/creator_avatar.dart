import 'package:flutter/material.dart';

class CreatorAvatar extends StatelessWidget {
  final String image;
  final EdgeInsetsGeometry? padding;
  const CreatorAvatar({Key? key, required this.image, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Image.asset(
          image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
