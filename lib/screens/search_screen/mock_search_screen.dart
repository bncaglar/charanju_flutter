import 'package:flutter/material.dart';

class MockSearchScreen extends StatelessWidget {
  const MockSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.red,
      child: Center(
        child: Text(
          "Search Page",
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
      ),
    );
  }
}
