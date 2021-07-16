import 'package:carousel_slider/carousel_slider.dart';
import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/helper/dummy_data/sopnsor_event_data.dart';
import 'package:charanju_flutter/helper/modules/discover_challenges_module.dart';
import 'package:charanju_flutter/logger/simple_log_printer.dart';
import 'package:charanju_flutter/logic/cubit/sponsor_current_image_index.dart';
import 'package:charanju_flutter/screens/search_screen/search_screen_categories_screens/search_screen_components/sponsor_events/sponsor_event_challenge_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class SponsorEventSlider extends StatefulWidget {
  final DiscoverChallengeModule? discoverChallenge;
  final CarouselController sliderController;

  SponsorEventSlider({
    Key? key,
    required this.discoverChallenge,
    required this.sliderController,
  }) : super(key: key);

  @override
  _SponsorEventSliderState createState() => _SponsorEventSliderState();
}

class _SponsorEventSliderState extends State<SponsorEventSlider> {
  late final List<Widget> imageSliders;
  final log = getLogger();

  prepareTheImageList() {
    log.i("prepareTheImageList Started");
    imageSliders = SponsorData.imgList
        .map((item) => Container(
              child: Container(
                child: Stack(
                  children: <Widget>[
                    buildSponsorEventHeaderPhoto(),
                    SponsorEventChallengeName(
                      discoverChallenge: widget.discoverChallenge,
                    ),
                  ],
                ),
              ),
            ))
        .toList();
  }

  @override
  void initState() {
    prepareTheImageList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SponsorCurrentImageIndexCubit, int>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          child: CarouselSlider(
            items: imageSliders,
            carouselController: widget.sliderController,
            options: CarouselOptions(
              autoPlay: true,
              height: 22.h,
              enlargeCenterPage: true,
              disableCenter: true,
              onPageChanged: (index, reason) {
                context
                    .read<SponsorCurrentImageIndexCubit>()
                    .changeIndex(index);
              },
            ),
          ),
        );
      },
    );
  }

  Container buildSponsorEventHeaderPhoto() {
    return Container(
      height: 22.h,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          ///todo get image or video from API
          fit: BoxFit.fill,
          image: AssetImage(Strings.IM_SPONSOR_HEADER_PHOTO),
        ),
      ),
    );
  }
}
