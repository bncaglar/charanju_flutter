import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

// ignore: must_be_immutable
class GetUsername extends StatefulWidget {
  String username;

  GetUsername({required this.username});

  @override
  _GetUsernameState createState() => _GetUsernameState();
}

class _GetUsernameState extends State<GetUsername> {
  final log = Logger();

  onClickUser() {
    log.i("onClickUsername started");
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClickUser();
      },
      child: username(),
    );
  }

  AutoSizeText username() {
    return AutoSizeText(
      "@" + widget.username,

      ///todo get username from API
      style: TextStyle(
        fontSize: LocalHelper.getFontSize(12),
        color: AppColors.primaryWightColor,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
