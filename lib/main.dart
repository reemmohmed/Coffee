import 'package:coffee_app/Featuers/OnBoarding/presentation/view/on_boarding.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CoffeeApp());
}

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoarding(),
    );
  }
}
