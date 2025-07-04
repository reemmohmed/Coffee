import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffee_app/Featuers/home/data/models.dart';
import 'package:coffee_app/Featuers/home/data/product_model.dart';
import 'package:coffee_app/Featuers/home/presentation/view/detals_view.dart';
import 'package:coffee_app/core/app_Image/image_app.dart';
import 'package:coffee_app/core/widgets/Custom_image_netork.dart';
import 'package:coffee_app/core/widgets/subtitel_text_widget.dart';
import 'package:coffee_app/core/widgets/titel_text_widget.dart';
import 'package:flutter/material.dart';

class CustomCatogery extends StatelessWidget {
  const CustomCatogery({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage(ImageApp.banner), context);

    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetalsView(productModel: productModel);
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
                  child: CustomImageNetWork(
                    imageUrl:
                        productModel.image ??
                        "https://t4.ftcdn.net/jpg/01/16/61/93/360_F_116619399_YA611bKNOW35ffK0OiyuaOcjAgXgKBui.jpg",
                  ),

                  //  Image.asset(ImageApp.banner, fit: BoxFit.cover,
                ),
              ),
              TitelTextWidget(text: productModel.titele ?? "coffee"),
              const SizedBox(height: 4),
              SubtitelTextWidget(
                text: productModel.subtitel ?? "Loderthdtajhb",
                fontWeight: FontWeight.w200,
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitelTextWidget(
                    text: productModel.price.toString() ?? r"$ 2345",
                  ),
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
