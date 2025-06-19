import 'package:coffee_app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Custombar extends StatelessWidget {
  const Custombar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.27, // بدل 240
      color: const Color(0xff111111),
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.06, // بدل 24
        vertical: size.height * 0.045,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Location",
            style: GoogleFonts.sora(
              fontSize: size.width * 0.03, // بدل 12
              fontWeight: FontWeight.w400,
              color: const Color(0xffA2A2A2),
            ),
          ),
          SizedBox(height: size.height * 0.005), // بدل 4
          Row(
            children: [
              Text(
                "Bilzen, Tanjungbalai",
                style: GoogleFonts.sora(
                  fontSize: size.width * 0.035, // بدل 14

                  fontWeight: FontWeight.w600,
                  color: const Color(0xffA2A2A2),
                ),
              ),
              SizedBox(width: size.width * 0.01), // بدل 4
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Color(0xffD8D8D8),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.03), // بدل 24
          Row(
            children: [
              Expanded(
                child: Container(
                  height: size.height * 0.06,
                  decoration: BoxDecoration(
                    color: const Color(0xff2A2A2A),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: CustomTextField(hintText: "Search for coffee"),
                ),
              ),
              SizedBox(width: size.width * 0.03), // بدل 12

              Container(
                width: size.width * 0.1, // بدل 40
                height: size.width * 0.1,
                decoration: BoxDecoration(
                  color: const Color(0xffC67C4E),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.tune, color: Colors.white, size: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// class CustomTextField extends StatelessWidget {
//   const CustomTextField({
//     super.key,
//     this.hintText,
//     this.border,
//     this.colorIcon,
//   });
//   final String? hintText;
//   final InputBorder? border;
//   final Color? colorIcon;
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       style: TextStyle(color: Colors.white),
//       decoration: InputDecoration(
//         prefixIcon: Icon(Ionicons.search, color: colorIcon ?? Colors.white),
//         hintText: "$hintText",
//         hintStyle: TextStyle(color: Colors.white54),
//         border: border ?? InputBorder.none,
//       ),
//     );
//   }
// }
