import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BuildProfilePicture extends StatefulWidget {
  final String imagePath;

  BuildProfilePicture({required this.imagePath});

  @override
  _BuildProfilePictureState createState() => _BuildProfilePictureState();
}

class _BuildProfilePictureState extends State<BuildProfilePicture> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 29.16.w,
      height: 16.40.h,
      child: Image.asset(
        widget.imagePath,
        fit: BoxFit.contain,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.primaryWightColor,
        ),
      ),
    );
  }
}
