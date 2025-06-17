import 'package:coffee_app/Featuers/home/presentation/view/detals_view.dart';
import 'package:coffee_app/core/app_Image/image_app.dart';
import 'package:coffee_app/core/widgets/subtitel_text_widget.dart';
import 'package:coffee_app/core/widgets/titel_text_widget.dart';
import 'package:flutter/material.dart';

class CustomCatogery extends StatelessWidget {
  const CustomCatogery({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
        // height: size.height * .8,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.grey, width: 2),
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AspectRatio(
                  aspectRatio: 3 / 2, //with to hight
                  child: Image.asset(ImageApp.banner, fit: BoxFit.cover),
                ),
              ),
              TitelTextWidget(text: "coffee"),
              const SizedBox(height: 4),
              SubtitelTextWidget(
                text: "Loderthdtajhb",
                fontWeight: FontWeight.w200,
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitelTextWidget(text: r"$ 2345"),
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.brown,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.add, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
