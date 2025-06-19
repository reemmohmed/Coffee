import 'package:coffee_app/core/widgets/titel_text_widget.dart';
import 'package:flutter/material.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TitelTextWidget(
          text: "Favourites",
          fontSize: size.width * 0.08,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
      ),

      body: Center(child: Text("data")),
    );
  }
}
