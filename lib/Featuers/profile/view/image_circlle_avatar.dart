import 'package:coffee_app/core/app_Image/image_app.dart';
import 'package:flutter/material.dart';

class ImageCirclleAvatar extends StatelessWidget {
  const ImageCirclleAvatar({super.key, this.radius});
  final double? radius;
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage(ImageApp.onboarding), context);

    return CircleAvatar(
      radius: radius ?? 30,
      backgroundImage: AssetImage(ImageApp.onboarding),
    );
  }
}
