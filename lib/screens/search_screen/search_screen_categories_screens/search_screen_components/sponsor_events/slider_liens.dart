import 'package:carousel_slider/carousel_controller.dart';
import 'package:charanju_flutter/helper/dummy_data/sopnsor_event_data.dart';
import 'package:charanju_flutter/logic/cubit/sponsor_current_image_index.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SliderLiens extends StatelessWidget {
  final CarouselController carouselController;

  const SliderLiens({
    Key? key,
    required this.carouselController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SponsorCurrentImageIndexCubit, int>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: SponsorData.imgList.asMap().entries.map(
            (entry) {
              return GestureDetector(
                onTap: () => carouselController.animateToPage(entry.key),
                child: Container(
                  width: 4.w,
                  height: 1.w,
                  margin:
                      EdgeInsets.symmetric(vertical: 1.25.h, horizontal: 1.1.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: AppColors.primaryWightColor.withOpacity(context
                                .read<SponsorCurrentImageIndexCubit>()
                                .getIndex() ==
                            entry.key
                        ? 0.9
                        : 0.4),
                  ),
                ),
              );
            },
          ).toList(),
        );
      },
    );
  }
}
