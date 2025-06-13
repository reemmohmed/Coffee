import 'package:coffee_app/Featuers/OnBoarding/presentation/view/widget/custom_on_boarding.dart';

import 'package:flutter/material.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});
  static const double hpad = 16;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Colors.black, body: CustomOnBoarding()),
    );
  }
}
