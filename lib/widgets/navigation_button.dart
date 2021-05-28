import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NavigationButton extends StatelessWidget {
  final String navigationButtonText;
  final EdgeInsets? margin;
  final Function onClickNavigatorButton;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;

  NavigationButton({
    required this.navigationButtonText,
    this.margin,
    required this.onClickNavigatorButton,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 6.84.h,
      margin: margin,
      decoration: buildBtnDecoration(),
      child: Stack(
        children: [
          buildColorFilter(),
          buildBtn(),
        ],
      ),
    );
  }

  ClipPath buildColorFilter() {
    return ClipPath(
      clipper: TriangleClipper(),
      child: Container(
        color: AppColors.primaryGreyColor.withOpacity(0.3),
      ),
    );
  }

  InkWell buildBtn() {
    return InkWell(
      onTap: () {
        onClickNavigatorButton();
      },
      child: buildBtnText(),
    );
  }

  BoxDecoration buildBtnDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColors.primaryPinkColor,
          AppColors.primaryBlueColor,
        ],
      ),
    );
  }

  Center buildBtnText() {
    return Center(
      child: Text(
        navigationButtonText,
        style: TextStyle(
          color: textColor ?? AppColors.primaryWightColor,
          fontFamily: Strings.ARIAL,
          fontSize: fontSize ?? 15.sp,
          fontStyle: FontStyle.normal,
          fontWeight: fontWeight ?? FontWeight.bold,
        ),
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.moveTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(size.width * 0.7, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
