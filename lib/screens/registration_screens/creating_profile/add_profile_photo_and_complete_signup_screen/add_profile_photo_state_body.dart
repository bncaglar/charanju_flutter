import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/logic/cubit/add_photo_cubit/add_photo_cubit.dart';
import 'package:charanju_flutter/screens/registration_screens/creating_profile/add_profile_photo_and_complete_signup_screen/add_photo_or_complete_btn.dart';
import 'package:charanju_flutter/screens/registration_screens/creating_profile/add_profile_photo_and_complete_signup_screen/skip_button.dart';
import 'package:charanju_flutter/screens/registration_screens/shared_widets/tow_part_text.dart';
import 'package:charanju_flutter/screens/registration_screens/terms_of_use/terms_of_use_screen.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

class AddProfilePhotoStep extends StatefulWidget {
  AddProfilePhotoStep({Key? key}) : super(key: key);

  @override
  _AddProfilePhotoStepState createState() => _AddProfilePhotoStepState();
}

class _AddProfilePhotoStepState extends State<AddProfilePhotoStep> {
  final log = Logger();

  goToTerms() {
    log.i("goToTerms Started");
    Navigator.of(context).pushNamed(TermsOfUseScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          buildProfilePictureAvatar(),
          buildTextBelowImage(),
          AddPhotoOrCompleteButton(),
          SkipButton(),
        ],
      ),
    );
  }

  BlocBuilder buildProfilePictureAvatar() {
    return BlocBuilder<AddPhotoCubit, AddPhotoState>(
      builder: (context, state) {
        if (state is AddPhotoStateInitial) {
          return initialImage();
        } else if (state is AddPhotoStateDone) {
          return uploadedImage();
        }
        return Container();
      },
    );
  }

  BlocBuilder buildTextBelowImage() {
    return BlocBuilder<AddPhotoCubit, AddPhotoState>(
      builder: (context, state) {
        if (state is AddPhotoStateInitial) {
          return buildRecognitionTextRow(context);
        } else if (state is AddPhotoStateDone) {
          return buildCompleteSignUpTermsText(context);
        }
        return Container();
      },
    );
  }

  Container buildCompleteSignUpTermsText(BuildContext context) {
    return Container(
      width: 88.90.w,
      padding: EdgeInsets.only(top: 4.21.h, left: 5.54.w, right: 5.54.w),
      child: Center(
        child: TowPartText(
          heroTag: Strings.TERMS_OF_USE_TAG,
          onClickText: goToTerms,
          clickableText: S.of(context).addCompleteSignUpTermsTextPart2,
          normalText: S.of(context).addCompleteSignUpTermsTextPart1,
        ),
      ),
    );
  }

  Padding buildRecognitionTextRow(BuildContext context) {
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
              fontSize: LocalHelper.getFontSize(12),
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Container initialImage() {
    return Container(
      width: 31.1.w,
      height: 17.49.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Strings.ADD_PROFILE_PHOTO_PNG),
        ),
      ),
    );
  }

  Container uploadedImage() {
    return Container(
      width: 31.1.w,
      height: 17.49.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          //todo get the image from the API and change the widget to NetworkImage
          image: AssetImage(Strings.NETWORK_IMAGE),
        ),
      ),
    );
  }
}
