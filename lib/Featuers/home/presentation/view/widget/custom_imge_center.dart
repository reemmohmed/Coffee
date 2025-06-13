import 'package:coffee_app/core/app_Image/image_app.dart';
import 'package:flutter/material.dart';

class CustomImageCenter extends StatelessWidget {
  const CustomImageCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 200,
      left: 24,
      right: 24,
      child: Container(
        height: 180,
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
