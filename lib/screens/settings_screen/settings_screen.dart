import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/screens/registration_screens/shared_widets/custom_app_bar.dart';
import 'package:charanju_flutter/screens/settings_screen/settings_category.dart';
import 'package:charanju_flutter/widgets/settings_divider.dart';
import 'package:charanju_flutter/widgets/settings_list_tile.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/SettingsScreen';
  static final log = Logger();

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  onTappedLanguage() {
    SettingsScreen.log.i("onTappedLanguage Started");
  }

  onTappedNotifications() {
    SettingsScreen.log.i("onTappedNotifications Started");
  }

  onTappedBackupFiles() {
    SettingsScreen.log.i("onTappedBackupFiles Started");
  }

  onTappedVideoLanguage() {
    SettingsScreen.log.i("onTappedVideoLanguage Started");
  }

  onTappedInterestSettings() {
    SettingsScreen.log.i("onTappedInterestSettings Started");
  }

  onTappedAnimatedMiniature() {
    SettingsScreen.log.i("onTappedAnimatedMiniature Started");
  }

  onTappedRemovePhotosensitiveVideos() {
    SettingsScreen.log.i("onTappedRemovePhotosensitiveVideos Started");
  }

  onTappedMobileDataUse() {
    SettingsScreen.log.i("onTappedMobileDataUse Started");
  }

  onTappedAccountActivity() {
    SettingsScreen.log.i("onTappedAccountActivity Started");
  }

  onTappedFreeUpSpace() {
    SettingsScreen.log.i("onTappedFreeUpSpace Started");
  }

  onPressedRemoveAccount() {
    SettingsScreen.log.i("onPressedRemoveAccount Started");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundPrimaryColor,
        body: buildSettingsScreenBody(context),
      ),
    );
  }

  SingleChildScrollView buildSettingsScreenBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildSettingsAppBar(context),
          buildGeneralSettings(context),
          SettingsDivider(),
          buildContentSettings(context),
          SettingsDivider(),
          buildDataSettings(context),
          buildRemoveAccountBtn(context),
        ],
      ),
    );
  }

  Container buildRemoveAccountBtn(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: 4.44.w,
        top: 7.8.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: onPressedRemoveAccount,
            child: AutoSizeText(
              S.of(context).removeAccount,
              style: TextStyle(
                color: AppColors.primaryWightColor,
                fontSize: LocalHelper.getFontSize(15),
                fontWeight: FontWeight.w400,
                fontFamily: Strings.C_ARIAL,
              ),
              maxLines: 2,
              minFontSize: 15,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  SettingsCategory buildGeneralSettings(BuildContext context) {
    return SettingsCategory(
      header: S.of(context).generalSettings,
      itemList: [
        SettingsListTile(
          leading: S.of(context).language,
          info: S.of(context).english,
          onTap: onTappedLanguage,
        ),
        SettingsListTile(
          leading: S.of(context).notifications,
          info: S.of(context).on,
          onTap: onTappedNotifications,
        ),
        SettingsListTile(
          leading: S.of(context).backupFiles,
          onTap: onTappedBackupFiles,
        ),
      ],
    );
  }

  SettingsCategory buildContentSettings(BuildContext context) {
    return SettingsCategory(
      header: S.of(context).contentSettings,
      itemList: [
        SettingsListTile(
          leading: S.of(context).videoLanguage,
          onTap: onTappedVideoLanguage,
        ),
        SettingsListTile(
          leading: S.of(context).interestSettings,
          onTap: onTappedInterestSettings,
        ),
        SettingsListTile(
          leading: S.of(context).animatedMiniature,
          onTap: onTappedAnimatedMiniature,
        ),
        SettingsListTile(
          leading: S.of(context).removePhotosensitiveVideos,
          info: S.of(context).on,
          onTap: onTappedRemovePhotosensitiveVideos,
        ),
      ],
    );
  }

  SettingsCategory buildDataSettings(BuildContext context) {
    return SettingsCategory(
      header: S.of(context).dataSettings,
      itemList: [
        SettingsListTile(
          leading: S.of(context).mobileDataUse,
          onTap: onTappedMobileDataUse,
        ),
        SettingsListTile(
          leading: S.of(context).accountActivity,
          onTap: onTappedAccountActivity,
        ),
        SettingsListTile(
          leading: S.of(context).freeUpSpace,
          onTap: onTappedFreeUpSpace,
        ),
      ],
    );
  }

  CustomAppBar buildSettingsAppBar(BuildContext context) {
    return CustomAppBar(
      title: S.of(context).settings,
      bottomPadding: 10,
    );
  }
}
