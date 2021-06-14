import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BiographyRow extends StatelessWidget {
  const BiographyRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 4.7.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: SizedBox(),
            ),
            Expanded(flex: 8, child: buildBiographyText(context)),
            Expanded(
                flex: 25,
                child: SizedBox(
                    child: buildBiographyContent(context), width: 90.w)),
          ],
        ),
      ],
    );
  }

  AutoSizeText buildBiographyContent(BuildContext context) {
    return AutoSizeText(
      //todo get biography content
      S.of(context).biographyLongText,
      style: TextStyle(
        color: AppColors.primaryWightColor,
        fontSize: LocalHelper.getFontSize(12),
      ),
      maxLines: 4,
      softWrap: true,
      minFontSize: 14,
      textAlign: TextAlign.left,
    );
  }

  AutoSizeText buildBiographyText(BuildContext context) {
    return AutoSizeText(
      S.of(context).biography + "\n",
      style: TextStyle(
        color: AppColors.primaryWightColor,
        fontSize: LocalHelper.getFontSize(12),
      ),
      maxLines: 1,
      minFontSize: 14,
      textAlign: TextAlign.left,
    );
  }
}
