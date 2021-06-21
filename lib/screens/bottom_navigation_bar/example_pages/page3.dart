import 'package:flutter/material.dart';
class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.green
        ),
        Center(
          child: Text("ADD CHALLENGE",style: TextStyle(
              fontSize: 40,
              color: Colors.white
          ),),
        )
      ],
    );
  }
}
