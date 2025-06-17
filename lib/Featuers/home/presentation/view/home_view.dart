import 'package:coffee_app/Featuers/home/presentation/view/widget/custom_bar.dart';
import 'package:coffee_app/Featuers/home/presentation/view/widget/custom_grid-view.dart';
import 'package:coffee_app/Featuers/home/presentation/view/widget/custom_imge_center.dart';
import 'package:coffee_app/core/widgets/subtitel_text_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [Custombar(), CustomImageCenter()],
            ),

            SizedBox(height: size.height * .12),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12),

                  SizedBox(
                    height: size.height * .055,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: CustomItem(),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: size.height * .01),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: CustomGridView(),
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

class CustomItem extends StatelessWidget {
  const CustomItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SubtitelTextWidget(text: "hyhydhyhstgjh"),
      ),
    );
  }
}
