import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

class ProfileImageStack extends StatelessWidget {
  final String backgroundImage;
  final String? cornerIcon;

  ProfileImageStack({
    required this.backgroundImage,
    this.cornerIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        buildBackgroundImage(),
        buildTopRightCornerIcon(),
      ],
    );
  }

  Positioned buildTopRightCornerIcon() {
    if (cornerIcon == null) {
      return Positioned(child: Container());
    }
    return Positioned(
      top: 1,
      right: 1,
      child: ClipPath(
        clipper: TriangleClipper(),
        child: Container(
          height: 7.73.w,
          width: 7.73.w,
          decoration: buildGradientBackground(),
          child: buildTheIcon(),
        ),
      ),
    );
  }

  Stack buildTheIcon() {
    return Stack(
      children: [
        Positioned(
          top: 0,
          right: 0,
          child: SizedBox(
            height: 4.4.w,
            width: 4.4.w,
            child: Image.asset(
              cornerIcon!,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }

  BoxDecoration buildGradientBackground() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.transparent,
          Colors.transparent,
          AppColors.backgroundProfileSmallIconColor.withOpacity(0.5),
        ],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      ),
    );
  }

  Container buildBackgroundImage() {
    return Container(
      decoration: buildBackgroundImageBorder(),
      child: Image.asset(
        backgroundImage,
        fit: BoxFit.cover,
        alignment: Alignment.center,
        filterQuality: FilterQuality.high,
      ),
    );
  }

  BoxDecoration buildBackgroundImageBorder() {
    return BoxDecoration(
      border: Border.all(
        color: AppColors.backgroundPrimaryColor,
        width: 0.27.w,
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
