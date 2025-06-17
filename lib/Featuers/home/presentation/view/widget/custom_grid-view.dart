import 'package:coffee_app/Featuers/home/presentation/view/widget/custom_catogery.dart';

import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = List.generate(
      20,
      (index) => 'Item ${index + 1}',
    );
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 15,
      crossAxisSpacing: 20,

      childAspectRatio: 0.75,
      children: List.generate(items.length, (index) => CustomCatogery()),
    );
  }
}
