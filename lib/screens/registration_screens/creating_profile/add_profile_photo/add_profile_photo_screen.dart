import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/screens/registration_screens/shared_widets/social_media_logo.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:charanju_flutter/widgets/navigation_button.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

class AddProfilePhotoScreen extends StatefulWidget {
  AddProfilePhotoScreen({Key? key}) : super(key: key);
  @override
  _AddProfilePhotoScreenState createState() => _AddProfilePhotoScreenState();
}

class _AddProfilePhotoScreenState extends State<AddProfilePhotoScreen> {
  final log = Logger();
  onClickFacebook(){
    log.i("onClickFacebook started");
    Navigator.pop(context);
  }
  onClickInstagram(){
    log.i("onClickInstagram started");
    Navigator.pop(context);
  }
  onClickTakePhoto(){
    log.i("onClickTakePhoto started");
    Navigator.pop(context);
  }
  onClickFromGallery(){
    log.i("onClickFromGallery started");
    Navigator.pop(context);
  }
  onClickAddPhoto() {
    log.i("onClickAddPhoto Started");
    onAddPhotoButtonPressed();
  }
  onClickSkip(){
    log.i("onClickSkip Started");
  }
  onClickBackBtn() {
    log.i("onClickBackBtn Started");
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          buildAddPhotoAppBar(context),
          profilePictureAvatar(),
          buildRecognitionText(),
          buildContinueNtb(),
          buildSkipText(),
        ],
      ),
    );
  }

  Container buildAddPhotoAppBar(BuildContext context){
    return Container(
      padding: EdgeInsets.only(
        left: 5.449.w,
        right: 5.449.w,
        top: 1.244.h,
        bottom: 9.05.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildBackBtn(),
          Spacer(),
          buildTitle(context),
          Spacer(),
          Placeholder(
            fallbackWidth: 24.0,
            strokeWidth: 24.0,
            fallbackHeight: 24.0,
            color: Colors.transparent,
          ),
        ],
      ),
    );
  }

  IconButton buildBackBtn() {
    return IconButton(
      onPressed: onClickBackBtn,
      icon: Icon(
        Icons.arrow_back_ios,
        color: AppColors.primaryWightColor,
        size: 17.sp,
      ),
    );
  }

  Container buildTitle(BuildContext context) {
    return Container(
        width: 44.25.w,
        child: AutoSizeText(
          S.of(context).addProfilePhoto,
          style: TextStyle(
            fontSize: 15.sp,
            color: AppColors.primaryWightColor,
            fontWeight: FontWeight.w400,
            fontFamily: Strings.ARIAL,
          ),
          minFontSize: 12,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ));
  }

  Container profilePictureAvatar() {
    return Container(
      padding: EdgeInsets.only(
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

  Padding buildRecognitionText(){
    return Padding(
      padding: EdgeInsets.only(
          top: 4.21.h,
          left: 5.54.w,
          right: 5.54.w
      ),
      child: Container(
        width: 88.90.w,
        height: 3.12.h,
        child: Center(
          child: Text(
            S.of(context).addaProfilePhotoRecognition,
            style: TextStyle(
              color: AppColors.textPrimaryColor,
              fontSize: 12.sp,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Padding buildContinueNtb() {
    return Padding(
      padding:  EdgeInsets.only(
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
  }

  InkWell buildSkipText(){ ///inkwell
    return InkWell(
      onTap: (){
        onClickSkip();
      },
      child: Text(
        S.of(context).skip,
        style: TextStyle(
          color: AppColors.textSkipColor,
          fontSize: ((15 * 30.0) / 35.0).sp,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
  void onAddPhotoButtonPressed () {
    showModalBottomSheet(
     context: context, builder: (context){
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

  Column _buildBottomNavigationMenu(){
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
      padding: EdgeInsets.only(
        top: 2.19.h,
        left: 45.w,
        right: 43.8.w
      ),
      child: Container(
        height: 1,
        width: 11.11.w,
        color: AppColors.primaryWightColor,
      ),
    );
  }

  InkWell importFromFacebook(){
    return InkWell(
      onTap: (){
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
            SizedBox(width: 3.3.w,),
            buildTextFacebook(),
          ],
        ),
      ),
    );
  }
  InkWell importFromInstagram(){
    return InkWell(
      onTap: (){
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
            SizedBox(width: 3.60.w,),
            buildTextInstagram(),
          ],
        ),
      ),
    );
  }
  InkWell importFromTakePhoto(){
    return InkWell(
      onTap: (){
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
              SizedBox(width: 3.3.w,),
              buildTextTakePhoto(),
            ],
          ),
        ),
      ),
    );
  }
  InkWell importFromGallery(){
    return InkWell(
      onTap: (){
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
            SizedBox(width: 3.05.w,),
            buildTextFromGallery(),
          ],
        ),
      ),
    );
  }

  Text buildTextFacebook(){
    return Text(
      //((fontSize! * 30.0) / 35.0).sp
      S.of(context).importFromFacebook,
      style: TextStyle(
        fontSize: ((15 * 30.0) / 35.0).sp,
        color: AppColors.primaryWightColor,
        fontWeight: FontWeight.w400,
        fontFamily: Strings.ARIAL,
      ),
    );
  }
  Text buildTextInstagram(){
    return Text(
      S.of(context).importFromInstagram,
      style: TextStyle(
        fontSize: ((15 * 30.0) / 35.0).sp,
        color: AppColors.primaryWightColor,
        fontWeight: FontWeight.w400,
        fontFamily: Strings.ARIAL,
      ),
    );
  }
  Text buildTextTakePhoto(){
    return Text(
      S.of(context).takePhoto,
      style: TextStyle(
        fontSize: ((15 * 30.0) / 35.0).sp,
        color: AppColors.primaryWightColor,
        fontWeight: FontWeight.w400,
        fontFamily: Strings.ARIAL,
      ),
    );
  }
  Text buildTextFromGallery(){
    return Text(
      S.of(context).chooseFromGallery,
      style: TextStyle(
        fontSize: ((15 * 30.0) / 35.0).sp,
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
      image: Strings.BOTTOM_SHEET_INSTAGRAM_PNG,
      socialMediaOnClick: onClickTakePhoto,
    );
  }
  SocialMediaLogo buildGalleryLogo() {
    return SocialMediaLogo(
      image: Strings.BOTTOM_SHEET_INSTAGRAM_PNG,
      socialMediaOnClick: onClickFromGallery,
    );
  }
}
