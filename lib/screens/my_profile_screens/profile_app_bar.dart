import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/logger/simple_log_printer.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileAppBar extends StatelessWidget {
  ProfileAppBar({Key? key}) : super(key: key);

  final log = getLogger();

  onClickMore() {
    log.i("onClickMore Started");
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildRightPlaceHolderAsHiddenIcon(),
        Spacer(),
        buildNameText(),
        Spacer(),
        buildMenuIcon(),
      ],
    );
  }

  Container buildRightPlaceHolderAsHiddenIcon() {
    return Container(
      padding: EdgeInsets.only(right: 2.7.w),
      child: IconButton(
        onPressed: null,
        icon: Image.asset(
          Strings.PROFILE_MENU_ICON,
          color: AppColors.backgroundPrimaryColor,
        ),
      ),
    );
  }

  Container buildMenuIcon() {
    return Container(
      padding: EdgeInsets.only(right: 2.7.w),
      child: IconButton(
        icon: Image.asset(
          Strings.PROFILE_MENU_ICON,
          color: AppColors.primaryWightColor,
        ),
        onPressed: onClickMore,
      ),
    );
  }

  AutoSizeText buildNameText() {
    return AutoSizeText(
      //todo get username from API
      "JacobSmith",
      style: TextStyle(
        color: AppColors.primaryWightColor,
        fontSize: LocalHelper.getFontSize(15),
        fontFamily: Strings.ARIAL,
        fontWeight: FontWeight.w400,
      ),
      maxLines: 1,
      minFontSize: 15,
      textAlign: TextAlign.center,
    );
  }
}
