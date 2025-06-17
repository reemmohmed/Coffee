import 'package:coffee_app/core/widgets/subtitel_text_widget.dart';
import 'package:flutter/material.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SubtitelTextWidget(text: "hyhydhyhstgjh"),
      ),
    );
  }
}
