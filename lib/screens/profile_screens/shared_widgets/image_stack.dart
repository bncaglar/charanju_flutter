import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ImageStack extends StatelessWidget {
  final String image;
  final String? icon;

  ImageStack({
    required this.image,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        buildImage(),
        buildTopRightCornerIcon(),
      ],
    );
  }

  Positioned buildTopRightCornerIcon() {
    if (icon == null) {
      return Positioned(child: SizedBox());
    }
    return Positioned(
      child: Image.asset(
        icon!,
        color: AppColors.primaryWightColor,
        height: 3.h,
        width: 5.w,
      ),
      top: 1,
      right: 1,
    );
  }

  Image buildImage() {
    return Image.asset(
      image,
      fit: BoxFit.cover,
      alignment: Alignment.center,
      filterQuality: FilterQuality.high,
    );
  }
}
