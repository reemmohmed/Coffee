import 'package:coffee_app/Featuers/my_cart/view/order_view.dart';
import 'package:coffee_app/core/app_Image/image_app.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            ListTile(
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
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(ImageApp.onboarding),
              ),
              title: Text(
                'John Doe',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(icon: Icon(Icons.edit), onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
