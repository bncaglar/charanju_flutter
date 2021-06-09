import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/logic/cubit/create_profile_cubit/create_profile_cubit.dart';
import 'package:charanju_flutter/logic/cubit/forget_password_cubit/forget_password_cubit.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatefulWidget {
  final String title;
  final double bottomPadding;
  final bool fromForgetPassword;

  CustomAppBar({
    required this.title,
    required this.bottomPadding,
    this.fromForgetPassword = false,
  });

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final log = Logger();

  onClickBackBtn() {
    log.i("onClickBackBtn Started");
    CreateProfileState state = context.read<CreateProfileCubit>().state;
    if (state is CreateProfileStepEnterEmail) {
      Navigator.pop(context);
      context
          .read<CreateProfileCubit>()
          .changeStep(CreateProfileStepEnterEmail());
    } else if (state is CreateProfileStepEnterPassword) {
      context
          .read<CreateProfileCubit>()
          .changeStep(CreateProfileStepEnterEmail());
    } else if (state is CreateProfileStepEnterUserName) {
      context
          .read<CreateProfileCubit>()
          .changeStep(CreateProfileStepEnterPassword());
    } else if (state is CreateProfileStepEnterBirthday) {
      context
          .read<CreateProfileCubit>()
          .changeStep(CreateProfileStepEnterUserName());
    } else if (state is CreateProfileStepAddPhoto) {
      context
          .read<CreateProfileCubit>()
          .changeStep(CreateProfileStepEnterBirthday());
    } else if (state is CreateProfileStepsCompleted) {
      context
          .read<CreateProfileCubit>()
          .changeStep(CreateProfileStepEnterBirthday());
    } else {
      Navigator.pop(context);
    }
  }

  onClickBackBtnForForgetPassword() {
    log.i("onClickBackBtnForForgetPassword Started");
    ForgetPasswordState state = context.read<ForgetPasswordCubit>().state;
    if (state is ForgetPasswordEmailStep) {
      Navigator.pop(context);
      context.read<ForgetPasswordCubit>().changeStep(ForgetPasswordEmailStep());
    } else if (state is ForgetPasswordCodeStep) {
      context.read<ForgetPasswordCubit>().changeStep(ForgetPasswordEmailStep());
    } else if (state is ForgetPasswordNewPasswordStep) {
      context.read<ForgetPasswordCubit>().changeStep(ForgetPasswordCodeStep());
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          buildAddPhotoAppBar(context),
        ],
      ),
    );
  }

  Container buildAddPhotoAppBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 5.449.w,
        right: 5.449.w,
        top: 1.244.h,
        bottom: widget.bottomPadding,
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
      onPressed: () {
        if (widget.fromForgetPassword) {
          onClickBackBtnForForgetPassword();
        } else {
          onClickBackBtn();
        }
      },
      icon: Icon(
        Icons.arrow_back_ios,
        color: AppColors.primaryWightColor,
        size: 17.sp,
      ),
    );
  }

  Center buildTitle(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: 44.25.w,
        child: AutoSizeText(
          this.widget.title,
          style: TextStyle(
            fontSize: LocalHelper.getFontSize(15),
            color: AppColors.primaryWightColor,
            fontWeight: FontWeight.w400,
            fontFamily: Strings.ARIAL,
          ),
          minFontSize: 12,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
