import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/screens/registration_screens/shared_widets/social_media_logo.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BottomSheetRow extends StatelessWidget {
  final Function onClickRow;
  final String iconUrl;
  final String rowText;
  final EdgeInsetsGeometry? padding;

  const BottomSheetRow({
    Key? key,
    required this.onClickRow,
    required this.iconUrl,
    required this.rowText,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClickRow();
      },
      child: Container(
        padding: padding ??
            EdgeInsets.only(
              top: 7.79.h,
              left: 7.77.w,
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildLogo(),
            SizedBox(
              width: 3.3.w,
            ),
            buildText(),
          ],
        ),
      ),
    );
  }

  SocialMediaLogo buildLogo() {
    return SocialMediaLogo(
      image: iconUrl,
      socialMediaOnClick: onClickRow,
    );
  }

  Text buildText() {
    return Text(
      rowText,
      style: TextStyle(
        fontSize: LocalHelper.getFontSize(15),
        color: AppColors.primaryWightColor,
        fontWeight: FontWeight.w400,
        fontFamily: Strings.C_ARIAL,
      ),
    );
  }
}
