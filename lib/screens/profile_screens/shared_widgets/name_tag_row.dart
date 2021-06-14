import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/logger/simple_log_printer.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NameTagRow extends StatelessWidget {
  const NameTagRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Spacer(
          flex: 30,
        ),
        Expanded(
          flex: 22,
          child: buildNameText(),
        ),
        Spacer(
          flex: 20,
        ),
        Expanded(flex: 10, child: buildMenuIcon()),
      ],
    );
  }

  IconButton buildMenuIcon() {
    final log = getLogger();
    return IconButton(
        icon: Image.asset(
          Strings.PROFILE_MENU_ICON,
          color: AppColors.primaryWightColor,
        ),
        onPressed: () {
          log.i("navigate to profile page options");
        });
  }

  AutoSizeText buildNameText() {
    return AutoSizeText(
      //todo get username data
      "JacobSmith",
      style: TextStyle(
        color: AppColors.primaryWightColor,
        fontSize: LocalHelper.getFontSize(15),
      ),
      maxLines: 1,
      minFontSize: 15,
      textAlign: TextAlign.center,
    );
  }
}
