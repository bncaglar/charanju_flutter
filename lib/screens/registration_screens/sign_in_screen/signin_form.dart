import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/widgets/form/email_field.dart';
import 'package:charanju_flutter/widgets/form/password_field.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final _signInKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 4.69.w, right: 4.69.w, top: 7.08.h),
      child: Form(
        key: _signInKey,
        child: Column(
          children: [
            buildEmailField(),
            buildPadding(),
            buildPasswordField(),
          ],
        ),
      ),
    );
  }

  SizedBox buildPadding() {
    return SizedBox(
      height: 3.57.h,
    );
  }

  Hero buildEmailField() {
    return Hero(
      tag: Strings.EMAIL_FIELD_TAG,
      child: EmailField(
        controller: emailController,
        serverEmailErrorText:
            null, //todo send the server error here after implement the API
      ),
    );
  }

  Hero buildPasswordField() {
    return Hero(
      tag: Strings.PASSWORD_FIELD_TAG,
      child: PasswordField(
        controller: passwordController,
        labelText: S.of(context).password,
        passwordServerError:
            null, //todo send the server error here after implement the API
      ),
    );
  }
}
