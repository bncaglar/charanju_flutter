import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';

class LinearGradientShadow extends StatefulWidget {
  final double height;
  final double topOpacity;
  final double bottomOpacity;
  final double topPadding;

  LinearGradientShadow(
      {required this.height,
      required this.topOpacity,
      required this.bottomOpacity,
      required this.topPadding});

  @override
  _LinearGradientShadowState createState() => _LinearGradientShadowState();
}

class _LinearGradientShadowState extends State<LinearGradientShadow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: widget.topPadding),
      child: linearGradient(),
    );
  }

  Container linearGradient() {
    return Container(
      height: widget.height,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.backgroundPrimaryColor.withOpacity(widget.topOpacity),
            AppColors.backgroundPrimaryColor.withOpacity(widget.bottomOpacity),
          ],
        ),
      ),
    );
  }
}
