import 'package:coffee_app/core/app_Image/image_app.dart';
import 'package:coffee_app/core/app_color.dart';
import 'package:coffee_app/core/widgets/subtitel_text_widget.dart';
import 'package:coffee_app/core/widgets/titel_text_widget.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TitelTextWidget(
          text: "Cart",
          fontSize: size.width * 0.08,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ItemCart(),
            SizedBox(height: size.height * 0.02),
            DotLine(),
            SizedBox(height: size.height * 0.02),
            CustomCouponCode(),
            SizedBox(height: size.height * 0.02),

            CustomDelevery(),
            TitelTextWidget(text: "text"),
          ],
        ),
      ),
    );
  }
}

class DotLine extends StatelessWidget {
  const DotLine({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedLine(
      direction: Axis.horizontal,
      lineLength: double.infinity,
      lineThickness: 1.0,
      dashLength: 6.0,
      dashColor: Colors.grey,
      dashGapLength: 4.0,
    );
  }
}

class ItemCart extends StatelessWidget {
  const ItemCart({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: size.width * 0.25, // العرض ثابت
                  child: AspectRatio(
                    aspectRatio: 1.0, // مربع: عرض = ارتفاع
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(ImageApp.banner, fit: BoxFit.cover),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SubtitelTextWidget(
                    text: "Cappuccino",
                    fontSize: size.width * 0.04,
                  ),
                  SizedBox(height: size.height * 0.005),
                  SubtitelTextWidget(
                    text: "Dalgona Macha",
                    fontSize: size.width * 0.035,
                  ),
                  SizedBox(height: size.height * 0.005),
                  SubtitelTextWidget(
                    text: "₹299",
                    fontSize: size.width * 0.035,
                  ),
                ],
              ),
            ),
            SizedBox(width: size.width * 0.03),
            Expanded(child: const ButtomAdd()),
            SizedBox(width: size.width * 0.01),
          ],
        ),
      ),
    );
  }
}

class ButtomAdd extends StatelessWidget {
  const ButtomAdd({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.03,
        vertical: size.height * 0.01,
      ),
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF), // خلفية داكنة مثل الصورة
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomIconCard(icon: Icons.remove, onPressed: () {}),

          SubtitelTextWidget(text: "1"),

          CustomIconCard(icon: Icons.add, onPressed: () {}),
        ],
      ),
    );
  }
}

class CustomIconCard extends StatelessWidget {
  const CustomIconCard({super.key, this.onPressed, required this.icon});
  final void Function()? onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: Color(0xffEFE3C8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: onPressed,
      icon: Icon(icon),
    );
  }
}

class CustomCouponCode extends StatelessWidget {
  const CustomCouponCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.content,
        border: Border.all(color: AppColors.primary),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Apply Coupon Code',
              style: const TextStyle(
                color: AppColors.textDark,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 20,
              color: AppColors.textDark,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDelevery extends StatelessWidget {
  const CustomDelevery({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitelTextWidget(text: "text"),
        CustomTextDelevary(text1: "Delivery Charges", text2: r"₹49"),
      ],
    );
  }
}

class CustomTextDelevary extends StatelessWidget {
  const CustomTextDelevary({
    super.key,
    required this.text1,
    required this.text2,
  });
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SubtitelTextWidget(text: text1, color: AppColors.textLight),
        SubtitelTextWidget(text: text2, color: AppColors.textLight),
      ],
    );
  }
}
