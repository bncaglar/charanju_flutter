import 'package:flutter/material.dart';
class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.blue
        ),
        Center(
          child: Text("Search",style: TextStyle(
              fontSize: 40,
              color: Colors.white
          ),),
        )
      ],
    );
  }
}
