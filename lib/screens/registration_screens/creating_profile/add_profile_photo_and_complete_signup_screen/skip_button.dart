import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/logic/cubit/add_photo_cubit/add_photo_cubit.dart';
import 'package:charanju_flutter/logic/cubit/create_profile_cubit/create_profile_cubit.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class SkipButton extends StatefulWidget {
  SkipButton({Key? key}) : super(key: key);

  @override
  _SkipButtonState createState() => _SkipButtonState();
}

class _SkipButtonState extends State<SkipButton> {
  final log = Logger();

  onClickSkip() {
    log.i("onClickSkip Started");
    context.read<AddPhotoCubit>().emit(AddPhotoStateDone(photoUrl: ""));
    context
        .read<CreateProfileCubit>()
        .changeStep(CreateProfileStepsCompleted());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPhotoCubit, AddPhotoState>(
      builder: (context, state) {
        if (state is AddPhotoStateInitial) {
          return InkWell(
            onTap: () {
              onClickSkip();
            },
            child: Text(
              S.of(context).skip,
              style: TextStyle(
                color: AppColors.textSkipColor,
                fontSize: LocalHelper.getFontSize(15),
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal,
                fontFamily: Strings.C_ARIAL,
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
