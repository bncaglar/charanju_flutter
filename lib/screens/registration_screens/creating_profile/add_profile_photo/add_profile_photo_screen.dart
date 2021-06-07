import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/logic/cubit/add_photo_cubit/add_photo_cubit.dart';
import 'package:charanju_flutter/screens/registration_screens/shared_widets/build_custom_app_bar.dart';
import 'package:charanju_flutter/screens/registration_screens/shared_widets/social_media_logo.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:charanju_flutter/widgets/navigation_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

import 'add_profile_photo_steps.dart';

class AddProfilePhotoScreen extends StatefulWidget {
  AddProfilePhotoScreen({Key? key}) : super(key: key);
  @override
  _AddProfilePhotoScreenState createState() => _AddProfilePhotoScreenState();
}

class _AddProfilePhotoScreenState extends State<AddProfilePhotoScreen> {
  String photoURL = "";
  final log = Logger();

  onClickFacebook() {
    log.i("onClickFacebook started");
    context.read<AddPhotoCubit>().emit(CreateProfileStepCompleteSignUp());
    Navigator.pushNamed(context, AddProfilePhotoStep.routeName);
    initState();
    Navigator.pop(context);
  }

  onClickInstagram() {
    log.i("onClickInstagram started");
    Navigator.pop(context);
  }

  onClickTakePhoto() {
    log.i("onClickTakePhoto started");
    Navigator.pop(context);
  }

  onClickFromGallery() {
    log.i("onClickFromGallery started");
    Navigator.pop(context);
  }

  onClickAddPhoto() {
    log.i("onClickAddPhoto Started");
    onAddPhotoButtonPressed();
  }

  onClickCompleteSignUp(){
    log.i("onClickCompleteSignUp Started");
  }
  onClickSkip() {
    log.i("onClickSkip Started");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          buildCustomAppBarSteps(),
          buildProfilePictureAvatar(),
          buildRecognitionText(),
          buildContinueNtb(),
          buildSkipText(),
        ],
      ),
    );
  }

  BlocBuilder<AddPhotoCubit, AddPhotoState> buildCustomAppBarSteps() {
    return BlocBuilder<AddPhotoCubit, AddPhotoState>(builder: (context, state) {
      if (state is CreateProfileStepAddPhoto) {
        return CustomAppBarText(S.of(context).addProfilePhoto);
      } else if (state is CreateProfileStepCompleteSignUp) {
        return CustomAppBarText(S.of(context).completeSignUp);
      }
      return Container();
    });
  }

  BlocBuilder<AddPhotoCubit, AddPhotoState> buildProfilePictureAvatar() {
    return BlocBuilder<AddPhotoCubit, AddPhotoState>(builder: (context, state) {
      if (state is CreateProfileStepAddPhoto) {
        return assetImage();
      } else if (state is CreateProfileStepAddPhoto) {
        return networkImage();
      }
      return Container();
    });
  }

  BlocBuilder<AddPhotoCubit, AddPhotoState> buildRecognitionText() {
    return BlocBuilder<AddPhotoCubit, AddPhotoState>(builder: (context, state) {
      if (state is CreateProfileStepAddPhoto) {
        return Padding(
          padding: EdgeInsets.only(top: 4.21.h, left: 5.54.w, right: 5.54.w),
          child: Container(
            width: 88.90.w,
            height: 3.12.h,
            child: Center(
              child: Text(
                S.of(context).addaProfilePhotoRecognition,
                style: TextStyle(
                  color: AppColors.textPrimaryColor,
                  fontSize: LocalHelper().getFontSize(12).sp,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        );
      } else if (state is CreateProfileStepCompleteSignUp) {
        return Padding(
          padding: EdgeInsets.only(top: 4.21.h, left: 5.54.w, right: 5.54.w),
          child: Container(
            width: 88.90.w,
            height: 3.12.h,
            child: Center(
              child: Text(
                S.of(context).addCompleteSignUpTermsText,
                style: TextStyle(
                  color: AppColors.textPrimaryColor,
                  fontSize: LocalHelper().getFontSize(12).sp,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        );
      }
      return Container();
    });
  }

  BlocBuilder<AddPhotoCubit, AddPhotoState> buildContinueNtb() {
    return BlocBuilder<AddPhotoCubit, AddPhotoState>(builder: (context, state) {
      if (state is CreateProfileStepAddPhoto) {
        return Padding(
          padding: EdgeInsets.only(
            top: 14.3.h,
            left: 4.54.w,
            right: 4.54.w,
          ),
          child: NavigationButton(
            navigationButtonText: S.of(context).addPhotoText,
            onClickNavigatorButton: onClickAddPhoto,
            margin: EdgeInsets.only(
              left: 4.69.w,
              right: 4.69.w,
              top: 5.754.h,
              bottom: 4.04.h,
            ),
          ),
        );
      } else if (state is CreateProfileStepCompleteSignUp) {
        return Padding(
          padding: EdgeInsets.only(
            top: 14.3.h,
            left: 4.54.w,
            right: 4.54.w,
          ),
          child: NavigationButton(
            navigationButtonText: S.of(context).completeSignUp,
            onClickNavigatorButton: onClickCompleteSignUp,
            margin: EdgeInsets.only(
              left: 4.69.w,
              right: 4.69.w,
              top: 5.754.h,
              bottom: 15.78.h,
            ),
          ),
        );
      }
      return Container();
    });
  }

  BlocBuilder<AddPhotoCubit, AddPhotoState> buildSkipText() {
    return BlocBuilder<AddPhotoCubit, AddPhotoState>(builder: (context, state) {
      if (state is CreateProfileStepAddPhoto) {
        return InkWell(
          onTap: () {
            onClickSkip();
          },
          child: Text(
            S.of(context).skip,
            style: TextStyle(
              color: AppColors.textSkipColor,
              fontSize: LocalHelper().getFontSize(15).sp,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
            ),
          ),
        );
      } else if (state is CreateProfileStepCompleteSignUp) {
        return Container();
      }
      return Container();
    });
  }

  Container assetImage(){
    return Container(
      padding: EdgeInsets.only( //seperate asset image
        left: 34.4.w,
        right: 34.4.w,
      ),
      width: 31.1.w,
      height: 17.49.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Strings.ADD_PROFILE_PHOTO_PNG),
        ),
      ),
    );
  }

  Container networkImage(){
    return Container( //Seperate network image
      padding: EdgeInsets.only(
        left: 34.4.w,
        right: 34.4.w,
      ),
      width: 31.1.w,
      height: 17.49.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(photoURL),
        ),
      ),
    );
  }

  void onAddPhotoButtonPressed() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            width: double.infinity,
            height: 47.16.h,
            child: _buildBottomNavigationMenu(),
            decoration: BoxDecoration(
              color: AppColors.modalBottomSheetColor,
            ),
          );
        });
  }


  Column _buildBottomNavigationMenu() {
    return Column(
      children: [
        straightLine(),
        importFromFacebook(),
        importFromInstagram(),
        importFromTakePhoto(),
        importFromGallery()
      ],
    );
  }

  Padding straightLine() {
    return Padding(
      padding: EdgeInsets.only(top: 2.19.h, left: 45.w, right: 43.8.w),
      child: Container(
        height: 1,
        width: 11.11.w,
        color: AppColors.primaryWightColor,
      ),
    );
  }

  InkWell importFromFacebook() {
    return InkWell(
      onTap: () {
        onClickFacebook();
      },
      child: Container(
        padding: EdgeInsets.only(
          top: 7.79.h,
          left: 7.77.w,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildFacebookLogo(),
            SizedBox(
              width: 3.3.w,
            ),
            buildTextFacebook(),
          ],
        ),
      ),
    );
  }

  InkWell importFromInstagram() {
    return InkWell(
      onTap: () {
        onClickInstagram();
      },
      child: Padding(
        padding: EdgeInsets.only(
          top: 3.59.h,
          left: 7.22.w,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildInstagramLogo(),
            SizedBox(
              width: 3.60.w,
            ),
            buildTextInstagram(),
          ],
        ),
      ),
    );
  }

  InkWell importFromTakePhoto() {
    return InkWell(
      onTap: () {
        onClickTakePhoto();
      },
      child: Padding(
        padding: EdgeInsets.only(
          top: 4.24.h,
          left: 7.77.w,
        ),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildTakePhotoLogo(),
              SizedBox(
                width: 3.3.w,
              ),
              buildTextTakePhoto(),
            ],
          ),
        ),
      ),
    );
  }

  InkWell importFromGallery() {
    return InkWell(
      onTap: () {
        onClickFromGallery();
      },
      child: Padding(
        padding: EdgeInsets.only(
          top: 3.62.h,
          left: 7.77.w,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildGalleryLogo(),
            SizedBox(
              width: 3.05.w,
            ),
            buildTextFromGallery(),
          ],
        ),
      ),
    );
  }

  Text buildTextFacebook() {
    return Text(
      //((fontSize! * 30.0) / 35.0).sp
      S.of(context).importFromFacebook,
      style: TextStyle(
        fontSize: LocalHelper().getFontSize(15).sp,
        color: AppColors.primaryWightColor,
        fontWeight: FontWeight.w400,
        fontFamily: Strings.ARIAL,
      ),
    );
  }

  Text buildTextInstagram() {
    return Text(
      S.of(context).importFromInstagram,
      style: TextStyle(
        fontSize: LocalHelper().getFontSize(15).sp,
        color: AppColors.primaryWightColor,
        fontWeight: FontWeight.w400,
        fontFamily: Strings.ARIAL,
      ),
    );
  }

  Text buildTextTakePhoto() {
    return Text(
      S.of(context).takePhoto,
      style: TextStyle(
        fontSize: LocalHelper().getFontSize(15).sp,
        color: AppColors.primaryWightColor,
        fontWeight: FontWeight.w400,
        fontFamily: Strings.ARIAL,
      ),
    );
  }

  Text buildTextFromGallery() {
    return Text(
      S.of(context).chooseFromGallery,
      style: TextStyle(
        fontSize: LocalHelper().getFontSize(15).sp,
        color: AppColors.primaryWightColor,
        fontWeight: FontWeight.w400,
        fontFamily: Strings.ARIAL,
      ),
    );
  }

  SocialMediaLogo buildFacebookLogo() {
    return SocialMediaLogo(
      image: Strings.BOTTOM_SHEET_FACEBOOK_PNG,
      socialMediaOnClick: onClickFacebook,
    );
  }

  SocialMediaLogo buildInstagramLogo() {
    return SocialMediaLogo(
      image: Strings.BOTTOM_SHEET_INSTAGRAM_PNG,
      socialMediaOnClick: onClickInstagram,
    );
  }

  SocialMediaLogo buildTakePhotoLogo() {
    return SocialMediaLogo(
      image: Strings.BOTTOM_SHEET_TAKE_PHOTO_PNG,
      socialMediaOnClick: onClickTakePhoto,
    );
  }

  SocialMediaLogo buildGalleryLogo() {
    return SocialMediaLogo(
      image: Strings.BOTTOM_SHEET_CHOOSE_FROM_GALLERY_PNG,
      socialMediaOnClick: onClickFromGallery,
    );
  }
}
