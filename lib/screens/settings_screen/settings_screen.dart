import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/screens/registration_screens/shared_widets/custom_app_bar.dart';
import 'package:charanju_flutter/screens/settings_screen/shared_widgets/settings_container.dart';
import 'package:charanju_flutter/screens/settings_screen/shared_widgets/settings_list_tile.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/SettingsScreen';
  static final log = Logger();

  const SettingsScreen({Key? key}) : super(key: key);

  onTappedLanguage() {
    log.i("onTappedLanguage Started");
  }

  onTappedNotifications() {
    log.i("onTappedNotifications Started");
  }

  onTappedBackupFiles() {
    log.i("onTappedBackupFiles Started");
  }

  onTappedVideoLanguage() {
    log.i("onTappedVideoLanguage Started");
  }

  onTappedInterestSettings() {
    log.i("onTappedInterestSettings Started");
  }

  onTappedAnimatedMiniature() {
    log.i("onTappedAnimatedMiniature Started");
  }

  onTappedRemovePhotosensitiveVideos() {
    log.i("onTappedRemovePhotosensitiveVideos Started");
  }

  onTappedMobileDataUse() {
    log.i("onTappedMobileDataUse Started");
  }

  onTappedAccountActivity() {
    log.i("onTappedAccountActivity Started");
  }

  onTappedFreeUpSpace() {
    log.i("onTappedFreeUpSpace Started");
  }

  onPressedRemoveAccount() {
    log.i("onPressedRemoveAccount Started");
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

  Column buildSettingsScreenBody(BuildContext context) {
    return Column(
      children: [
        buildCustomAppBar(context),
        generalSettingsContainer(context),
        Divider(
          color: AppColors.transparentGrayColor,
          thickness: 1.sp,
          indent: 4.7.w,
          endIndent: 4.7.w,
        ),
        contentSettingsContainer(context),
        Divider(
          color: AppColors.transparentGrayColor,
          thickness: 1.sp,
          indent: 4.7.w,
          endIndent: 4.7.w,
        ),
        dataSettingsContainer(context),
        removeAccountTextButton(context),
      ],
    );
  }

  Padding removeAccountTextButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 56.5.w,
        top: 7.8.h,
      ),
      child: TextButton(
        onPressed: () {
          onPressedRemoveAccount();
        },
        child: AutoSizeText(
          S.of(context).removeAccount,
          style: TextStyle(
            color: AppColors.primaryWightColor,
            fontSize: LocalHelper.getFontSize(15),
          ),
          maxLines: 2,
          minFontSize: 15,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  SettingsContainer generalSettingsContainer(BuildContext context) {
    return SettingsContainer(
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

  SettingsContainer contentSettingsContainer(BuildContext context) {
    return SettingsContainer(
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

  SettingsContainer dataSettingsContainer(BuildContext context) {
    return SettingsContainer(
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

  CustomAppBar buildCustomAppBar(BuildContext context) {
    return CustomAppBar(
      title: S.of(context).settings,
      bottomPadding: 10,
    );
  }
}
