import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SocialMediaLogo extends StatelessWidget {
  final String? image;
  final Function socialMediaOnClick;
  SocialMediaLogo({
    required this.image,
    required this.socialMediaOnClick,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        socialMediaOnClick();
      },
      child: Container(
        width: 6.35.w,
        child: Image.asset(
          image!,
        ),
      ),
    );
  }
}
