import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/helper/modules/discover_challenges_module.dart';
import 'package:charanju_flutter/screens/search_screen/search_screen_categories_screens/search_screen_components/custom_auto_size_text.dart';
import 'package:charanju_flutter/screens/search_screen/search_screen_categories_screens/search_screen_components/sponsor_events/slider_liens.dart';
import 'package:charanju_flutter/screens/search_screen/search_screen_categories_screens/search_screen_components/sponsor_events/sponsor_event_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SponsorEventPart extends StatefulWidget {
  final DiscoverChallengeModule? discoverChallenge;

  SponsorEventPart({required this.discoverChallenge});

  @override
  _SponsorEventPartState createState() => _SponsorEventPartState();
}

class _SponsorEventPartState extends State<SponsorEventPart> {
  final CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        sponsorEventTitle(),
        SponsorEventSlider(
          discoverChallenge: widget.discoverChallenge,
          sliderController: controller,
        ),
        SliderLiens(
          carouselController: controller,
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
}
