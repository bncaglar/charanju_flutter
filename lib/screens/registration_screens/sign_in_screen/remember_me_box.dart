import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/logic/cubit/remember_me_cubit.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class TheCheckBox extends StatelessWidget {
  final Function rememberMeOnClick;
  TheCheckBox({
    required this.rememberMeOnClick,
  });
  @override
  Widget build(BuildContext context) {
    return buildRememberMeCheckBox(context);
  }

  BlocBuilder buildRememberMeCheckBox(BuildContext context) {
    return BlocBuilder<RememberMeCubit, bool>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            rememberMeOnClick();
          },
          child: Container(
            width: 3.5.h,
            height: 3.5.h,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
              border: Border.all(
                color: AppColors.rememberMeBoxColor,
                width: 2,
              ),
            ),
            child: state ? Image.asset(Strings.IC_CHECK_ICON_PNG) : null,
          ),
        );
      },
    );
  }
}
