import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/screens/home_screens/home_screen_components/creator-user_data.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:charanju_flutter/widgets/linear_gradient_shadow.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OneBackgroundSplitImage extends StatefulWidget {
  final String imagePath;
  final bool rightImage;
  final bool leftImage;

  OneBackgroundSplitImage({
    required this.imagePath,
    required this.leftImage,
    required this.rightImage,
  });

  @override
  _OneBackgroundSplitImageState createState() =>
      _OneBackgroundSplitImageState();
}

class _OneBackgroundSplitImageState extends State<OneBackgroundSplitImage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildBackgroundImage(),
        upLinearGradientShadow(),
        downLinearGradientShadow(),
        buildCreatorData(),
      ],
    );
  }

  Positioned buildCreatorData() {
    return Positioned(
      bottom: 4.27.h,
      right: 0,
      left: 0,
      child: CreatorUserData(
        rightImage: widget.rightImage,
        leftImage: widget.leftImage,
      ),
    );
  }

  Container buildBackgroundImage() {
    return Container(
      height: 90.60.h,
      width: 49.5.w,
      decoration: BoxDecoration(
        border: Border(
          right: widget.leftImage
              ? BorderSide(
                  color: AppColors.primaryWightColor,
                  width: LocalHelper.getFontSize(1),
                )
              : BorderSide.none,
          left: widget.rightImage
              ? BorderSide(
                  color: AppColors.primaryWightColor,
                  width: LocalHelper.getFontSize(1),
                )
              : BorderSide.none,
          top: BorderSide.none,
          bottom: BorderSide.none,
        ),
        image: DecorationImage(
          ///todo get image or video from API
          fit: BoxFit.fill,
          image: AssetImage(widget.imagePath),
        ),
      ),
    );
  }

  LinearGradientShadow downLinearGradientShadow() {
    return LinearGradientShadow(
        topPadding: 68.66.h,
        height: 22.18.h,
        topOpacity: 0.00,
        bottomOpacity: 0.60);
  }

  LinearGradientShadow upLinearGradientShadow() {
    return LinearGradientShadow(
        topPadding: 0.h, height: 15.44.h, topOpacity: 0.60, bottomOpacity: 0.0);
  }
}
