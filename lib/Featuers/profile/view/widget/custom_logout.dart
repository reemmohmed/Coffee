import 'package:coffee_app/core/widgets/titel_text_widget.dart';
import 'package:flutter/material.dart';

class CustomLogOut extends StatelessWidget {
  const CustomLogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TitelTextWidget(text: "Logout"),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.logout, color: Colors.brown, size: 30),
        ),
      ],
    );
  }
}
