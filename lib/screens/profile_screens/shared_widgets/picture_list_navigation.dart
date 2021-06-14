import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/screens/profile_screens/shared_widgets/iconDividerColumn.dart';
import 'package:charanju_flutter/screens/profile_screens/shared_widgets/image_stack.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class PictureListNavigation extends StatefulWidget {
  const PictureListNavigation({Key? key}) : super(key: key);

  @override
  _PictureListNavigationState createState() => _PictureListNavigationState();
}

class _PictureListNavigationState extends State<PictureListNavigation> {
  final log = Logger();
  bool _trophyPressed = false;
  bool _balanceScalePressed = false;
  bool _achievementPressed = true;

  onClickTrophyIconButton() {
    // log.i("onClickTrophyIconButton Started");
    // return setState(() {
    //   _displayed = _trophyImages;
    //   _trophyPressed = true;
    //   _balanceScalePressed = false;
    //   _achievementPressed = false;
    // });
  }

  onClickBalanceIconButton() {
    // log.i("onClickBalanceIconButton Started");
    // return setState(() {
    //   _displayed = _balanceImages;
    //   _trophyPressed = false;
    //   _balanceScalePressed = true;
    //   _achievementPressed = false;
    // });
  }

  onClickAchievementIconButton() {
    // log.i("onClickAchievementIconButton Started");
    // return setState(() {
    //   _displayed = _achievementImages;
    //   _trophyPressed = false;
    //   _balanceScalePressed = false;
    //   _achievementPressed = true;
    // });
  }

  final List<ImageStack> _trophyImages = [
    ImageStack(image: Strings.MY_TROPHY_IMAGE_1, icon: Strings.SURFACE_ICON),
    ImageStack(image: Strings.MY_TROPHY_IMAGE_2, icon: Strings.TROPYHY_ICON),
    ImageStack(image: Strings.MY_TROPHY_IMAGE_3, icon: Strings.MEDAL_ICON),
    ImageStack(image: Strings.MY_TROPHY_IMAGE_4, icon: Strings.MEDAL_ICON),
    ImageStack(image: Strings.MY_TROPHY_IMAGE_5, icon: Strings.MEDAL_ICON),
    ImageStack(image: Strings.MY_TROPHY_IMAGE_6, icon: Strings.TROPYHY_ICON),
  ];
  final List<ImageStack> _balanceImages = [
    ImageStack(image: Strings.MY_BALANCE_IMAGE_1),
    ImageStack(image: Strings.MY_BALANCE_IMAGE_2, icon: Strings.TROPYHY_ICON),
    ImageStack(image: Strings.MY_BALANCE_IMAGE_3),
  ];
  final List<ImageStack> _achievementImages = [
    ImageStack(image: Strings.MY_ACHIEVEMENT_IMAGE_1),
    ImageStack(
        image: Strings.MY_ACHIEVEMENT_IMAGE_2, icon: Strings.TROPYHY_ICON),
    ImageStack(image: Strings.MY_ACHIEVEMENT_IMAGE_3),
    ImageStack(
        image: Strings.MY_ACHIEVEMENT_IMAGE_4, icon: Strings.TROPYHY_ICON),
    ImageStack(image: Strings.MY_ACHIEVEMENT_IMAGE_5),
    ImageStack(image: Strings.MY_ACHIEVEMENT_IMAGE_6),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Spacer(
                flex: 4,
              ),
              Expanded(
                flex: 4,
                child: IconDividerColumn(
                  icon: Strings.TROPYHY_ICON,
                  iconOnClick: onClickTrophyIconButton,
                  pressed: _trophyPressed,
                ),
              ),
              Spacer(
                flex: 4,
              ),
              Expanded(
                flex: 4,
                child: IconDividerColumn(
                  icon: Strings.BALANCE_SCALE_ICON,
                  iconOnClick: onClickBalanceIconButton,
                  pressed: _balanceScalePressed,
                ),
              ),
              Spacer(
                flex: 4,
              ),
              Expanded(
                flex: 4,
                child: IconDividerColumn(
                  icon: Strings.ACHIEVEMENT_ICON,
                  iconOnClick: onClickAchievementIconButton,
                  pressed: _achievementPressed,
                ),
              ),
              Spacer(
                flex: 4,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 30,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 0.9),
            itemCount: _achievementImages.length,
            //todo get my profile trophy images
            itemBuilder: (BuildContext context, int index) =>
                _achievementImages[index],
          ),
        ),
      ],
    );
  }
}
