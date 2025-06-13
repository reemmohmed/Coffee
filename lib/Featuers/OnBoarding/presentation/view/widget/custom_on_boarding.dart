import 'package:coffee_app/Featuers/home/presentation/view/home_view.dart';
import 'package:coffee_app/Featuers/nave_bar/presentation/view/nave_bar_view.dart';
import 'package:coffee_app/core/app_Image/image_app.dart';
import 'package:coffee_app/core/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomOnBoarding extends StatelessWidget {
  const CustomOnBoarding({super.key});
  static const double hpad = 8;
  static const double tob = 16;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(ImageApp.onboarding),
        // ignore: deprecated_member_use
        Container(color: Colors.black.withOpacity(0.3)),
        // النص والزر فوق الصورة
        Positioned(
          left: 24,
          right: 24,
          bottom: 50,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 327,
                child: Text(
                  "Fall in Love with\nCoffee in Blissful Delight!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.sora(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                    letterSpacing: 0.16, // 0.5% من حجم الخط
                    color: AppColors.textLight,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Welcome to our cozy coffee corner, where every cup is a delightful for you.",
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.content, fontSize: 16),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 327,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return NaveBar();
                        },
                      ),
                    );
                    // الانتقال للشاشة التالية
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.button,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.fromLTRB(hpad, tob, hpad, tob),
                  ),
                  child: Text(
                    "Get Started",
                    style: GoogleFonts.sora(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                      letterSpacing: 0, // 0.5% من حجم الخط
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
