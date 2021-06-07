import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';

class ForgetPasswordSteps extends StatefulWidget {
  static const routeName = '/ForgetPasswordSteps';

  ForgetPasswordSteps({Key? key}) : super(key: key);

  @override
  _ForgetPasswordStepsState createState() => _ForgetPasswordStepsState();
}

class _ForgetPasswordStepsState extends State<ForgetPasswordSteps> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundPrimaryColor,
      body: buildForgetPasswordStepBody(context),
    ));
  }
  Container buildForgetPasswordStepBody(BuildContext context) {
    return Container(
      child: Column(
        children: [

        ],
      ),
    );
  }
}
