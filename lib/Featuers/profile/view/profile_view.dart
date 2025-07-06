import 'package:coffee_app/Featuers/my_cart/presentation/view/cart_view.dart';
import 'package:coffee_app/Featuers/my_cart/presentation/view/order_view.dart';
import 'package:coffee_app/Featuers/profile/view/image_circlle_avatar.dart';
import 'package:coffee_app/Featuers/profile/view/widget/custom_list_titel.dart';
import 'package:coffee_app/Featuers/profile/view/widget/custom_logout.dart';
import 'package:coffee_app/core/app_Image/image_app.dart';
import 'package:coffee_app/core/widgets/titel_text_widget.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    precacheImage(AssetImage(ImageApp.onboarding), context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.06),
            ImageCirclleAvatar(radius: 40),
            SizedBox(height: size.height * 0.08),
            CustomListTitel(
              titel: "My Order",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return OrderView();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.03),
            CustomListTitel(
              titel: "My Cart",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CartView();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.04),
            CustomLogOut(),
          ],
        ),
      ),
    );
  }
}
