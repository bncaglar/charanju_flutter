import 'package:flutter/material.dart';

class BuildOrientation extends StatefulWidget {
  final Widget landscape;
  final Widget portrait;

  BuildOrientation({required this.landscape, required this.portrait});

  @override
  _BuildOrientationState createState() => _BuildOrientationState();
}

class _BuildOrientationState extends State<BuildOrientation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: OrientationBuilder(
          builder: (context, orientation) => orientation == Orientation.portrait
              ? widget.portrait
              : widget.landscape),
    );
  }
}
