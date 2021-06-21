import 'package:flutter/material.dart';
class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.red
        ),
        Center(
          child: Text("HOMEPAGE",style: TextStyle(
            fontSize: 40,
            color: Colors.white
          ),),
        )
      ],
    );
  }
}
