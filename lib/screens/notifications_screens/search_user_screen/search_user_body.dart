import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/helper/modules/notification_module.dart';
import 'package:charanju_flutter/logger/simple_log_printer.dart';
import 'package:charanju_flutter/helper/dummy_data/notification_data.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_screen_components/avatar.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:charanju_flutter/widgets/icon_btn_as_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SearchUserBody extends StatefulWidget {
  const SearchUserBody({Key? key}) : super(key: key);

  @override
  _SearchUserBodyState createState() => _SearchUserBodyState();
}

class _SearchUserBodyState extends State<SearchUserBody> {
  final log = getLogger();

  onTapCreateGroupChatRow() {
    log.i("onTapCreateGroupChatRow started");
  }

  onClickUser(item) {
    log.i("onClickUser started with " + item.username);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 3.125.h),
        buildCreateGroupChatRow(),
        SizedBox(height: 1.40.h),
        buildUserList()
      ],
    );
  }

  GestureDetector buildCreateGroupChatRow() {
    return GestureDetector(
      onTap: onTapCreateGroupChatRow,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 6.94.w),
            buildGroupChatIcon(),
            SizedBox(width: 2.77.w),
            buildGroupChatText()
          ],
        ),
      ),
    );
  }

  ListView buildUserList() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: 3,
      itemBuilder: (context, index) {
        final item = NotificationData.items[index];
        return buildListTile(item);
      },
    );
  }

  IconBtnAsPngImage buildGroupChatIcon() {
    return IconBtnAsPngImage(
        imageUrl: Strings.IC_USER_ALT_PNG, onClickBtn: onTapCreateGroupChatRow);
  }

  AutoSizeText buildGroupChatText() {
    return AutoSizeText(
      S.of(context).createGroupChat,
      style: TextStyle(
        fontSize: LocalHelper.getFontSize(15),
        color: AppColors.primaryWightColor,
        fontWeight: FontWeight.w700,
        fontFamily: Strings.C_ARIAL,
      ),
    );
  }

  Widget buildListTile(NotificationModule item) => ListTile(
        contentPadding: EdgeInsets.only(
          left: 4.44.w,
          bottom: 1.87.h,
        ),
        leading: NotificationAvatar(
          imagePath: item.urlAvatar,
        ),
        title: buildUsernameTitle(item),
        onTap: () {
          onClickUser(item);
        },
      );

  AutoSizeText buildUsernameTitle(item) {
    return AutoSizeText(
      item.username,
      style: TextStyle(
        fontSize: LocalHelper.getFontSize(15),
        color: AppColors.primaryWightColor,
        fontWeight: FontWeight.w700,
        fontFamily: Strings.C_ARIAL,
      ),
    );
  }
}
