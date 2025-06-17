import 'package:coffee_app/core/app_Image/image_app.dart';
import 'package:flutter/material.dart';

class CustomImageCenter extends StatelessWidget {
  const CustomImageCenter({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      top: size.height * .2,
      left: size.width * .02,
      right: size.width * .02,
      child: Container(
        height: size.height * .2 / 1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: const DecorationImage(
            image: AssetImage(ImageApp.banner),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
