import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SplitImages extends StatefulWidget {
  String imagePath;

  SplitImages({required this.imagePath});

  @override
  _SplitImagesState createState() => _SplitImagesState();
}

class _SplitImagesState extends State<SplitImages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.60.h,
      width: 49.5.w,
      decoration: BoxDecoration(
          image: DecorationImage(

              ///todo get image or video from API
              fit: BoxFit.fill,
              image: AssetImage(widget.imagePath))),
    );
  }
}
