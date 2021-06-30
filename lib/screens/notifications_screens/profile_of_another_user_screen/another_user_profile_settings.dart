import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/screens/notifications_screens/profile_of_another_user_screen/biography_content.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

class AnotherUserProfileSettings extends StatefulWidget {
  final String? username;

  const AnotherUserProfileSettings({
    Key? key,
    this.username,
  }) : super(key: key);

  @override
  _AnotherUserProfileSettingsState createState() =>
      _AnotherUserProfileSettingsState();
}

class _AnotherUserProfileSettingsState
    extends State<AnotherUserProfileSettings> {
  final log = Logger();
  late String username;
  late List<String> profileSettingsTexts;
  late List<Function> profileSettingsFunctions;

  onClickAddUserToChat() {
    log.i("onClickAddUserToChat started");
  }

  onClickChallengeUser() {
    log.i("onClickChallengeUser started");
  }

  onClickCreateTeam() {
    log.i("onClickCreateTeam started");
  }

  onClickSilenceChat() {
    log.i("onClickSilenceChat started");
  }

  onClickBlock() {
    log.i("onClickBlock started");
  }

  onClickReport() {
    log.i("onClickReport started");
  }

  onClickEmptyFunction() {}

  initiateSettings() {
    log.i("initiateSettings started");
    username = widget.username!;
    profileSettingsTexts = [
      S.current.addUsersToThis,
      S.current.challenge + username,
      S.current.createTeamChallengeWith + username,
      S.current.non,
      S.current.silenceChat,
      S.current.block,
      S.current.report,
    ];
    profileSettingsFunctions = [
      onClickAddUserToChat,
      onClickChallengeUser,
      onClickCreateTeam,
      onClickEmptyFunction,
      onClickSilenceChat,
      onClickBlock,
      onClickReport,
    ];
  }

  @override
  void initState() {
    initiateSettings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: (profileSettingsTexts.length),
      itemBuilder: (BuildContext context, int index) {
        if (index == 3)
          return SizedBox(
            height: 4.84.h,
          );
        return buildRectangle(
          text: profileSettingsTexts[index],
          onClick: () {
            profileSettingsFunctions[index]();
          },
        );
      },
    );
  }

  buildRectangle({
    required text,
    required onClick,
  }) {
    return Container(
      padding: EdgeInsets.only(left: 4.72.w),
      height: 7.343.h,
      width: double.infinity,
      color: AppColors.modalBottomSheetColor,
      child: Padding(
        padding: EdgeInsets.only(
          top: 2.10.h,
          bottom: 2.10.h,
        ),
        child: BiographyContent(
          content: text,
          onClick: onClick,
        ),
      ),
    );
  }
}
