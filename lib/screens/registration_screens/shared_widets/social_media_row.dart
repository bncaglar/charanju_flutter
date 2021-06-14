import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/screens/profile_screens/my_profile_screen.dart';
import 'package:charanju_flutter/screens/registration_screens/shared_widets/social_media_logo.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

class SocialMediaRow extends StatefulWidget {
  @override
  _SocialMediaRowState createState() => _SocialMediaRowState();
}

class _SocialMediaRowState extends State<SocialMediaRow> {
  final log = Logger();
  appleOnClick() {
    log.i("appleOnClick started");
    Navigator.pushNamed(context, MyProfileScreen.routeName);
  }

  facebookOnClick() {
    log.i("facebookOnClick started");
  }

  googleOnClick() {
    log.i("googleOnClick started");
  }

  twitterOnClick() {
    log.i("twitterOnClick started");
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: Strings.SOCIAL_MEDIA_TAG,
      child: Container(
        width: 100.w,
        padding: EdgeInsets.only(top: 2.48.h, right: 26.475.w, left: 26.475.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildFacebookLogo(),
            buildGoogleLogo(),
            buildTwitterLogo(),
            buildAppleLogo(),
          ],
        ),
      ),
    );
  }

  SocialMediaLogo buildAppleLogo() {
    return SocialMediaLogo(
      image: Strings.APPLE_ICON_PNG,
      socialMediaOnClick: appleOnClick,
    );
  }

  SocialMediaLogo buildTwitterLogo() {
    return SocialMediaLogo(
      image: Strings.TWITTER_ICON_PNG,
      socialMediaOnClick: twitterOnClick,
    );
  }

  SocialMediaLogo buildGoogleLogo() {
    return SocialMediaLogo(
      image: Strings.GOOGLE_ICON_PNG,
      socialMediaOnClick: googleOnClick,
    );
  }

  SocialMediaLogo buildFacebookLogo() {
    return SocialMediaLogo(
      image: Strings.FACEBOOK_ICON_PNG,
      socialMediaOnClick: facebookOnClick,
    );
  }
}
