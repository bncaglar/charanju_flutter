import 'package:charanju_flutter/logic/cubit/add_photo_cubit/add_photo_cubit.dart';
import 'package:charanju_flutter/screens/registration_screens/creating_profile/add_profile_photo/add_profile_photo_screen.dart';
import 'package:charanju_flutter/screens/registration_screens/shared_widets/already_have_account_text.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class AddProfilePhotoStep extends StatefulWidget {
  static const routeName = '/AddProfilePhotoStep';

  AddProfilePhotoStep({Key? key}) : super(key: key);

  @override
  _AddProfilePhotoStepState createState() => _AddProfilePhotoStepState();
}

class _AddProfilePhotoStepState extends State<AddProfilePhotoStep> {
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
          AlreadyHaveAccountText()
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
}
