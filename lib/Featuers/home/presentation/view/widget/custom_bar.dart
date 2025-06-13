import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Custombar extends StatelessWidget {
  const Custombar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      color: const Color(0xff111111),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Location",
            style: GoogleFonts.sora(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: const Color(0xffA2A2A2),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                "Bilzen, Tanjungbalai",
                style: GoogleFonts.sora(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xffA2A2A2),
                ),
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Color(0xffD8D8D8),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 52,
                  decoration: BoxDecoration(
                    color: const Color(0xff2A2A2A),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.white),
                      hintText: 'Search coffee',
                      hintStyle: TextStyle(color: Colors.white54),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 40,
                height: 40,
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
