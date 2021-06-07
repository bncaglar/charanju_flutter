import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/logic/cubit/add_photo_cubit/add_photo_cubit.dart';
import 'package:charanju_flutter/screens/registration_screens/creating_profile/add_profile_photo/add_profile_photo_screen.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

class AddProfilePhotoStep extends StatefulWidget {
  static const routeName = '/AddProfilePhotoStep';

  AddProfilePhotoStep({Key? key}) : super(key: key);

  @override
  _AddProfilePhotoStepState createState() => _AddProfilePhotoStepState();
}

class _AddProfilePhotoStepState extends State<AddProfilePhotoStep> {

  final log = Logger();
  onClickSignIn(){
    log.i("onClickSignIn started");
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.backgroundPrimaryColor,
          body: buildAddProfilePhotoStepBody(context),
        )
    );
  }
  Container buildAddProfilePhotoStepBody(BuildContext context) {
    return Container(
      child: Column(
        children: [
          buildAddPhotoSteps(),
          SizedBox(height: 9.52.h,),
          buildAlreadyHaveAccount(),
        ],
      ),
    );
  }
  BlocBuilder<AddPhotoCubit, AddPhotoState> buildAddPhotoSteps(){
    return BlocBuilder<AddPhotoCubit, AddPhotoState>(
        builder: (context, state) {
          if(state is CreateProfileStepAddPhoto){
            return AddProfilePhotoScreen();
          }
          return Container();
        }
    );
  }
  Container buildAlreadyHaveAccount() {
    return Container(
        width: 48.6.w,
        height: 2.51.h,
        child: alreadyHaveAccountText()
    );
  }

  Row alreadyHaveAccountText(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).alreadyHaveAccount,
          style: TextStyle(
            color: AppColors.textPrimaryColor,
            fontSize: ((10 * 30.0) / 35.0).sp,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal,
          ),
        ),
        InkWell(
          onTap: (){
            onClickSignIn();
          },
          child: Text(
            S.of(context).signIn,
            style: TextStyle(
              color: AppColors.textSkipColor,
              fontSize: 10.sp,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
            ),
          ),
        )
      ],
    );
  }

}
