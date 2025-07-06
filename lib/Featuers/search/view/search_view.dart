import 'package:coffee_app/Featuers/home/presentation/mange/Home_Cubit/home_cubit_cubit.dart';
import 'package:coffee_app/Featuers/home/presentation/view/widget/custom_catogery.dart';
import 'package:coffee_app/core/app_Image/image_app.dart';
import 'package:coffee_app/core/app_color.dart';
import 'package:coffee_app/core/widgets/custom_text_field.dart';
import 'package:coffee_app/core/widgets/titel_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubitCubit>()..searchResults.clear();
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: TitelTextWidget(
            text: "Search",
            fontSize: size.width * 0.07,
            fontWeight: FontWeight.w600,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.06,
            vertical: size.height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔍 Search Field
              CustomTextField(
                labelText: "Search",
                onChanged: (value) => cubit.searchProducts(value),
                colorhintText: AppColors.textDark,
                colorIcon: AppColors.textDark,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
              SizedBox(height: size.height * 0.02),

              /// 🏷️ Categories Title
              TitelTextWidget(
                text: "Categories",
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: size.height * 0.01),

              /// ✅ Categories Grid
              CustomGridCount(),

              SizedBox(height: size.height * 0.02),

              /// ✅ Products Grid
              Expanded(
                child: BlocBuilder<HomeCubitCubit, HomeCubitState>(
                  builder: (context, state) {
                    if (state is HomeCubitLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is HomeCubitError) {
                      return const Center(
                        child: Text("Error loading products"),
                      );
                    } else if (cubit.searchResults.isEmpty) {
                      return const Center(child: Text("No products found"));
                    }

                    return NotificationListener<ScrollNotification>(
                      onNotification: (notification) {
                        if (notification.metrics.pixels >=
                            notification.metrics.maxScrollExtent - 200) {
                          cubit.loadMoreSearchResults();
                        }
                        return true;
                      },
                      child: GridView.builder(
                        itemCount: cubit.searchResults.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 20,
                              childAspectRatio: 0.75,
                            ),
                        itemBuilder: (context, index) {
                          return CustomCatogery(
                            productModel: cubit.searchResults[index],
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomGridCount extends StatelessWidget {
  const CustomGridCount({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubitCubit>();

    return BlocBuilder<HomeCubitCubit, HomeCubitState>(
      builder: (context, state) {
        if (cubit.allCategories.isEmpty) {
          return const Text("No categories found");
        }
        return GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 2.5,
          children: cubit.allCategories.map((category) {
            return InkWell(
              onTap: () => cubit.filterByCategory(category),
              child: CatogeriesWidget(
                image: ImageApp.onboarding,
                titel: category,
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class CatogeriesWidget extends StatelessWidget {
  const CatogeriesWidget({super.key, required this.image, required this.titel});

  final String image, titel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.brown.shade100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: size.height * 0.025,
            width: size.width * 0.05,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              titel,
              style: TextStyle(
                fontSize: size.width * 0.03,
                fontWeight: FontWeight.w600,
                color: const Color(0xff562B1A),
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
