import 'package:charanju_flutter/screens/my_profile_screens/profile_biography.dart';
import 'package:charanju_flutter/screens/my_profile_screens/profile_picture_gallery.dart';
import 'package:charanju_flutter/screens/my_profile_screens/profile_app_bar.dart';
import 'package:charanju_flutter/screens/my_profile_screens/profile_picture_row.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:charanju_flutter/widgets/build_orientation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyProfileScreen extends StatelessWidget {
  static const routeName = '/MyProfileScreen';

  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundPrimaryColor,
        body: BuildOrientation(
          portrait: buildMyProfileScreenBodyPortrait(context),
          landscape: buildMyProfileScreenBodyLandscape(context),
        ),
      ),
    );
  }

  Container buildMyProfileScreenBodyPortrait(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 0.78.h,
      ),
      child: Column(
        children: [
          ProfileAppBar(),
          ProfilePictureAndData(),
          ProfileBiography(),
          ProfilePictureGallery(),
        ],
      ),
    );
  }

  Container buildMyProfileScreenBodyLandscape(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 0.78.h,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ProfileAppBar(),
            ProfilePictureAndData(),
            ProfileBiography(),
            ProfilePictureGallery(),
          ],
        ),
      ),
    );
  }
}
