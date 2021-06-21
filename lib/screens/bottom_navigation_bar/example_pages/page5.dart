import 'package:flutter/material.dart';
class Page5 extends StatefulWidget {
  @override
  _Page5State createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.pink
        ),
        Center(
          child: Text("PROFILE PAGE",style: TextStyle(
              fontSize: 40,
              color: Colors.white
          ),),
        )
      ],
    );
  }
}
