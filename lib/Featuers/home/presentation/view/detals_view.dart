import 'package:coffee_app/core/app_Image/image_app.dart';
import 'package:coffee_app/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetalsView extends StatelessWidget {
  const DetalsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "details"),

      backgroundColor: Colors.white,
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 3 / 2,
            child: Image.asset(ImageApp.onboarding, fit: BoxFit.cover),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: CustomDetalse(),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDetalse extends StatelessWidget {
  const CustomDetalse({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Cappuccino",
          style: GoogleFonts.sora(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 20),
            const SizedBox(width: 4),
            Text(
              "4.5",
              style: GoogleFonts.sora(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              "(230)",
              style: GoogleFonts.sora(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          "Description",
          style: GoogleFonts.sora(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          "A cappuccino is an espresso-based coffee drink that originated in Italy, and is traditionally prepared with steamed milk foam.",
          style: GoogleFonts.sora(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 24),

        Text(
          "Size",
          style: GoogleFonts.sora(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),

        // الأحجام
        Row(
          children: [
            buildSizeOption("S", isSelected: true),
            const SizedBox(width: 12),
            buildSizeOption("M"),
            const SizedBox(width: 12),
            buildSizeOption("L"),
          ],
        ),
        const Spacer(),

        // السعر وزر الإضافة
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "\$",
                    style: GoogleFonts.sora(
                      fontSize: 20,
                      color: const Color(0xffC67C4E),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: " 4.20",
                    style: GoogleFonts.sora(
                      fontSize: 28,
                      color: const Color(0xffC67C4E),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffC67C4E),
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 18,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {},
              child: Row(
                children: [
                  const Icon(Icons.shopping_bag_outlined, color: Colors.white),
                  const SizedBox(width: 8),
                  Text(
                    "Add to Cart",
                    style: GoogleFonts.sora(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildSizeOption(String size, {bool isSelected = false}) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xffC67C4E) : const Color(0xffF3F3F3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          size,
          style: GoogleFonts.sora(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
