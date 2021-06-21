import 'package:flutter/material.dart';
class Page4 extends StatefulWidget {
  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.orangeAccent
        ),
        Center(
          child: Text("NOTIFICATIONS",style: TextStyle(
              fontSize: 40,
              color: Colors.white
          ),),
        )
      ],
    );
  }
}
