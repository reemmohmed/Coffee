import 'package:coffee_app/Featuers/profile/view/image_circlle_avatar.dart';
import 'package:flutter/material.dart';

class CustomListTitel extends StatelessWidget {
  const CustomListTitel({super.key, required this.titel, this.onTap});
  final String titel;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        onTap: onTap,

        leading: ImageCirclleAvatar(),
        title: Text(
          titel,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        trailing: IconButton(
          icon: Icon(Icons.arrow_forward_ios),
          onPressed: () {},
        ),
      ),
    );
  }
}
