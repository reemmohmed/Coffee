import 'package:coffee_app/Featuers/home/presentation/view/widget/product_item.dart';
import 'package:coffee_app/core/app_Image/image_app.dart';
import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 15,
      crossAxisSpacing: 20,
      childAspectRatio: 0.7,

      children: const [
        ProductItem(
          image: ImageApp.banner,
          name: "Cappuccino",
          description: "With Oat Milk",
          price: "4.20",
          rating: "4.5",
        ),
        ProductItem(
          image: ImageApp.banner,
          name: "Espresso",
          description: "Strong taste",
          price: "3.50",
          rating: "4.7",
        ),
        ProductItem(
          image: ImageApp.banner,
          name: "Latte",
          description: "With Almond Milk",
          price: "4.00",
          rating: "4.8",
        ),
        ProductItem(
          image: ImageApp.banner,
          name: "Flat White",
          description: "Smooth taste",
          price: "3.80",
          rating: "4.6",
        ),
      ],
    );
  }
}
