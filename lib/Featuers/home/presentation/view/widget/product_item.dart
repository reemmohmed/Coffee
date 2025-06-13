// Widget الكارت الخاص بالمنتج (عملناه Extract)
import 'package:coffee_app/Featuers/home/presentation/view/detals_view.dart';
import 'package:coffee_app/core/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductItem extends StatelessWidget {
  final String image;
  final String name;
  final String description;
  final String price;
  final String rating;

  const ProductItem({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetalsView();
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffF9F9F9),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة المنتج
            Container(
              height: 130,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.sora(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: GoogleFonts.sora(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 4),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          r"$ 2345",
                          style: GoogleFonts.sora(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 1),
                        child: IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.brown,
                          ),

                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                            size: 20,

                            color: AppColors.textLight,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
