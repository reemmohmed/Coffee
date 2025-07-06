import 'package:coffee_app/core/app_Image/image_app.dart';
import 'package:coffee_app/core/app_color.dart';
import 'package:coffee_app/core/widgets/subtitel_text_widget.dart';
import 'package:coffee_app/core/widgets/titel_text_widget.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage(ImageApp.onboarding), context);

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TitelTextWidget(
          text: " Your Cart",
          color: Color(0xff4A2B29),
          fontSize: size.width * 0.08,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomListItem(),
            // ItemCart(),
            SizedBox(height: size.height * 0.03),
            DotLine(),
            SizedBox(height: size.height * 0.02),
            CustomCouponCode(),
            SizedBox(height: size.height * 0.02),
            CustomTax(textPrice: r"₹299", textnam: "Subtothomecal"),
            SizedBox(height: size.height * 0.02),
            CustomTax(textPrice: r"₹299", textnam: "Subtotal"),
            SizedBox(height: size.height * 0.02),
            DotLine(),
            CustomTax(
              textPrice: r"₹1009.87",

              fontSize2: 20,
              textnam: "Grand Total",
              fontSize: 20,
            ),
            SizedBox(height: size.height * 0.05),
            CustomButtonCart(),
            SizedBox(height: size.height * 0.02),
          ],
        ),
      ),
    );
  }
}

class CustomButtonCart extends StatelessWidget {
  const CustomButtonCart({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.06,
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: Color(0xffEFE3C8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: TitelTextWidget(
          text: "PAY NOW",
          fontSize: size.width * 0.045,
          color: Color(0xff4A2B29),
        ),
      ),
    );
  }
}

class CustomTax extends StatelessWidget {
  const CustomTax({
    super.key,
    required this.textnam,
    required this.textPrice,
    this.color,
    this.fontSize,
    this.fontSize2,
  });
  final String textnam;
  final String textPrice;
  final Color? color;
  final double? fontSize;
  final double? fontSize2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SubtitelTextWidget(
          text: textnam,
          color: color ?? AppColors.textDark,
          fontSize: fontSize ?? 18,
        ),
        SubtitelTextWidget(text: textPrice, fontSize: fontSize ?? 14),
      ],
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

class CustomListItem extends StatelessWidget {
  const CustomListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * (320 / 896), // 896 = ارتفاع شاشة iPhone 11 مثلاً
      width: size.width * (414 / 414),
      child: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,

        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 8),
            child: ItemCart(),
          );
        },
      ),
    );
  }
}
