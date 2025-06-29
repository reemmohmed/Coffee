import 'package:coffee_app/Featuers/home/presentation/view/widget/custom_catogery.dart';
import 'package:coffee_app/core/app_Image/image_app.dart';
import 'package:coffee_app/core/app_color.dart';
import 'package:coffee_app/core/widgets/custom_text_field.dart';
import 'package:coffee_app/core/widgets/subtitel_text_widget.dart';
import 'package:coffee_app/core/widgets/titel_text_widget.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TitelTextWidget(
          text: "Search",
          fontSize: size.width * 0.07,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
      ),

      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.06,
                vertical: size.height * 0.02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.01,
                    ),
                    height: size.height * (50 / 896),
                    width: size.width * (345 / 414),
                    child: CustomTextField(
                      labelText: "Search",
                      colorhintText: AppColors.textDark,
                      colorIcon: AppColors.textDark,
                      fillColor: const Color(0xffffffff),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  TitelTextWidget(
                    text: "Categories",
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: size.height * 0.01),
                  CustomGridCatogery(),
                  SizedBox(height: size.height * 0.02),
                ],
              ),
            ),
          ),

          // 🟩 SliverGrid for grid view
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Text("data"),
                // CustomCatogery(
                //   productModel: ,
                // ),
                // childCount: 20,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 20,
                childAspectRatio: 0.75,
              ),
            ),
          ),
        ],
      ),
    );

    //    Padding(
    //     padding: EdgeInsets.symmetric(
    //       horizontal: size.width * 0.06,
    //       vertical: size.height * 0.02,
    //     ),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Container(
    //           padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
    //           height: size.height * (50 / 896),
    //           width: size.width * (345 / 414),

    //           child: CustomTextField(
    //             labelText: "Search",
    //             colorhintText: AppColors.textDark,
    //             colorIcon: AppColors.textDark,
    //             fillColor: const Color(0xffffffff),
    //             border: OutlineInputBorder(
    //               borderRadius: BorderRadius.circular(18),
    //               borderSide: BorderSide(color: Colors.grey, width: 1.0),
    //             ),
    //           ),
    //         ),
    //         SizedBox(height: size.height * 0.02),
    //         TitelTextWidget(
    //           text: "Categories",
    //           fontSize: size.width * 0.05,
    //           fontWeight: FontWeight.w600,
    //         ),
    //         SizedBox(height: size.height * 0.01),
    //         CustomGridCatogery(),
    //         Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 4),
    //           child: CustomGridView(),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}

class CustomGridCatogery extends StatelessWidget {
  const CustomGridCatogery({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisSpacing: 20,
      mainAxisSpacing: 12,
      childAspectRatio: 2.5,
      children: List.generate(
        5, // ← عدد العناصر المطلوب توليدها
        (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CatogeriesWidget(
              image: ImageApp.onboarding,
              titel: "Coffee",
            ),
          );
        },
      ),
    );
  }
}

class CatogeriesWidget extends StatelessWidget {
  const CatogeriesWidget({super.key, required this.image, required this.titel});
  final String image, titel;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        // Navigator.pushNamed(context, SearchView.id, arguments: titel);
      },
      child: Container(
        padding: EdgeInsets.all(12),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(0xffffffff),
        ),
        child: Row(
          children: [
            Image.asset(
              image,
              height: size.height * 0.022, // تقريبًا 20 على شاشة طولها 896
              width: size.width * 0.048, // تقريبًا 20 على شاشة عرضها 414
            ),
            SizedBox(width: size.width * 0.006),
            SubtitelTextWidget(
              text: titel,
              fontSize: size.width * (12 / 414),
              fontWeight: FontWeight.w700,
              color: Color(0xff562B1A),
            ),
          ],
        ),
      ),
    );
  }
}
