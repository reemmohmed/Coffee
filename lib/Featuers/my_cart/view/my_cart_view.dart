import 'package:flutter/material.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "My Cart View",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
