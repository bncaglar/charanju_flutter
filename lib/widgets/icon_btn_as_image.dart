import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class IconBtnAsPngImage extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onClickBtn;
  final BoxFit? boxFit;

  const IconBtnAsPngImage({
    Key? key,
    required this.imageUrl,
    required this.onClickBtn,
    this.boxFit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onClickBtn,
      icon: Container(
        height: 3.75.h,
        width: 6.66.w,
        child: Image.asset(
          imageUrl,
          fit: boxFit ?? BoxFit.fill,
        ),
      ),
    );
  }
}
