import 'package:charanju_flutter/screens/profile_screens/shared_widgets/biography_row.dart';
import 'package:charanju_flutter/screens/profile_screens/shared_widgets/name_tag_row.dart';
import 'package:charanju_flutter/screens/profile_screens/shared_widgets/picture_list_navigation.dart';
import 'package:charanju_flutter/screens/profile_screens/shared_widgets/profile_picture_row.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';

class MyProfileScreen extends StatelessWidget {
  static const routeName = '/MyProfileScreen';
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundPrimaryColor,
        body: buildMyProfileScreenBody(context),
      ),
    );
  }

  Container buildMyProfileScreenBody(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(),
          ),
          Expanded(
            flex: 5,
            child: NameTagRow(),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(),
          ),
          Expanded(
            flex: 16,
            child: ProfilePictureRow(),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          Expanded(
            flex: 14,
            child: BiographyRow(),
          ),
          Expanded(
            flex: 57,
            child: PictureListNavigation(),
          ),
        ],
      ),
    );
  }
}
