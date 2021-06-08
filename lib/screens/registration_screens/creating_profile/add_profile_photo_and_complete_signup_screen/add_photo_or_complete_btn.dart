import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/logic/cubit/add_photo_cubit/add_photo_cubit.dart';
import 'package:charanju_flutter/logic/cubit/create_profile_cubit/create_profile_cubit.dart';
import 'package:charanju_flutter/screens/registration_screens/sign_in_screen/signin_screen.dart';
import 'package:charanju_flutter/widgets/bottom_sheet_row.dart';
import 'package:charanju_flutter/widgets/navigation_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

class AddPhotoOrCompleteButton extends StatefulWidget {
  AddPhotoOrCompleteButton({Key? key}) : super(key: key);

  @override
  _AddPhotoOrCompleteButtonState createState() =>
      _AddPhotoOrCompleteButtonState();
}

class _AddPhotoOrCompleteButtonState extends State<AddPhotoOrCompleteButton> {
  final log = Logger();

  onClickAddPhoto() {
    log.i("onClickAddPhoto Started");
    CreateProfileState state = context.read<CreateProfileCubit>().state;
    if (state is CreateProfileStepsCompleted) {
      Navigator.of(context).pushNamed(SignInScreen.routeName);
    } else {
      LocalHelper.showTheBottomSheet(
        context: context,
        child: _buildBottomNavigationMenu(),
      );
    }
  }

  onClickFacebook() {
    log.i("onClickFacebook started");
    //todo get the image from the API
    context
        .read<AddPhotoCubit>()
        .addNewPhoto(photoURL: Strings.SCREENS_TEXT_LOGO_PNG);
    context.read<CreateProfileCubit>().emit(CreateProfileStepsCompleted());
    Navigator.pop(context);
  }

  onClickInstagram() {
    log.i("onClickInstagram started");
    //todo get the image from the API
    context
        .read<AddPhotoCubit>()
        .addNewPhoto(photoURL: Strings.SCREENS_TEXT_LOGO_PNG);
    context.read<CreateProfileCubit>().emit(CreateProfileStepsCompleted());
    Navigator.pop(context);
  }

  onClickTakePhoto() {
    log.i("onClickTakePhoto started");
    //todo get the image from the camera
    context
        .read<AddPhotoCubit>()
        .addNewPhoto(photoURL: Strings.SCREENS_TEXT_LOGO_PNG);
    context.read<CreateProfileCubit>().emit(CreateProfileStepsCompleted());
    Navigator.pop(context);
  }

  onClickFromGallery() {
    log.i("onClickFromGallery started");
    //todo get the image from the Gallery
    context
        .read<AddPhotoCubit>()
        .addNewPhoto(photoURL: Strings.SCREENS_TEXT_LOGO_PNG);
    context.read<CreateProfileCubit>().emit(CreateProfileStepsCompleted());
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPhotoCubit, AddPhotoState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(
            top: 14.3.h,
            left: 4.54.w,
            right: 4.54.w,
          ),
          child: NavigationButton(
            navigationButtonText: (state is AddPhotoStateInitial)
                ? S.of(context).addPhotoText
                : S.of(context).completeSignUp,
            onClickNavigatorButton: onClickAddPhoto,
            margin: EdgeInsets.only(
              left: 4.69.w,
              right: 4.69.w,
              top: 5.754.h,
              bottom: 4.04.h,
            ),
          ),
        );
      },
    );
  }

  Column _buildBottomNavigationMenu() {
    return Column(
      children: [
        buildFacebookRow(),
        buildInstagramRow(),
        buildTakePhotoRow(),
        buildGalleryRow(),
      ],
    );
  }

  BottomSheetRow buildGalleryRow() {
    return BottomSheetRow(
      iconUrl: Strings.BOTTOM_SHEET_CHOOSE_FROM_GALLERY_PNG,
      onClickRow: onClickFromGallery,
      rowText: S.of(context).chooseFromGallery,
      padding: EdgeInsets.only(
        top: 3.59.h,
        left: 7.22.w,
      ),
    );
  }

  BottomSheetRow buildTakePhotoRow() {
    return BottomSheetRow(
      iconUrl: Strings.BOTTOM_SHEET_TAKE_PHOTO_PNG,
      onClickRow: onClickTakePhoto,
      rowText: S.of(context).takePhoto,
      padding: EdgeInsets.only(
        top: 3.59.h,
        left: 7.22.w,
      ),
    );
  }

  BottomSheetRow buildInstagramRow() {
    return BottomSheetRow(
      iconUrl: Strings.BOTTOM_SHEET_INSTAGRAM_PNG,
      onClickRow: onClickInstagram,
      rowText: S.of(context).importFromInstagram,
      padding: EdgeInsets.only(
        top: 3.59.h,
        left: 7.22.w,
      ),
    );
  }

  BottomSheetRow buildFacebookRow() {
    return BottomSheetRow(
      iconUrl: Strings.BOTTOM_SHEET_FACEBOOK_PNG,
      onClickRow: onClickFacebook,
      rowText: S.of(context).importFromFacebook,
    );
  }
}
