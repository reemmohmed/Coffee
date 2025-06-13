import 'package:coffee_app/Featuers/home/presentation/view/widget/custom_bar.dart';
import 'package:coffee_app/Featuers/home/presentation/view/widget/custom_grid-view.dart';
import 'package:coffee_app/Featuers/home/presentation/view/widget/custom_imge_center.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ده مكان الصورة طبعا انت هتضبط المسار حسب مشروعك

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // الهيدر والخلفية السوداء
            Stack(
              clipBehavior: Clip.none,
              children: [
                Custombar(),

                // البنر في المنتصف بين الأسود والأبيض
                CustomImageCenter(),
              ],
            ),

            const SizedBox(height: 150),

            // عنوان رئيسي
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),

                  // الفلاتر
                  SizedBox(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        buildCategory("All", isActive: true),
                        buildCategory("Cappuccino"),
                        buildCategory("Espresso"),
                        buildCategory("Latte"),
                        buildCategory("Flat White"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // المنتجات في GridView
                  CustomGridView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategory(String title, {bool isActive = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xffC67C4E) : const Color(0xffF3F3F3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.sora(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isActive ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
