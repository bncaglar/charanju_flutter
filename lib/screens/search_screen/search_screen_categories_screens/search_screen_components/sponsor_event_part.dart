import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/screens/search_screen/search_screen_categories_screens/search_screen_components/custom_auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class SponsorEventPage extends StatefulWidget {
  var discoverChallenge;

  SponsorEventPage({required this.discoverChallenge});

  @override
  _SponsorEventPageState createState() => _SponsorEventPageState();
}

class _SponsorEventPageState extends State<SponsorEventPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        sponsorEventTitle(),
        Container(
          height: 22.h,
          width: double.infinity,
          child: Stack(
            children: [
              sponsorEventHeaderPhoto(),
              sponsorEventChallengeName(widget.discoverChallenge)
            ],
          ),
        ),
      ],
    );
  }

  Align sponsorEventTitle() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(top: 0.78.h, left: 2.77.w),
        child: Container(
          width: 28.61.w,
          height: 3.43.h,
          child: SearchScreenCustomAutoSizeText(
              content: S.of(context).sponsorEvents),
        ),
      ),
    );
  }

  Container sponsorEventHeaderPhoto() {
    return Container(
      height: 22.h,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          ///todo get image or video from API
          fit: BoxFit.fill,
          image: AssetImage(Strings.SPONSOR_HEADER_PHOTO),
        ),
      ),
    );
  }

  Padding sponsorEventChallengeName(discoverChallenge) {
    return Padding(
      padding: EdgeInsets.only(
        top: 1.56.h,
        left: 2.77.w,
      ),
      child: Container(
        width: 25.56.w,
        height: 3.43.h,
        child: SearchScreenCustomAutoSizeText(
          content: discoverChallenge.isSponsorEvent
              ? discoverChallenge.challengeName
              : Container(),
        ),
      ),
    );
  }
}
