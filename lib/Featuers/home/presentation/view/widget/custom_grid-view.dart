import 'package:coffee_app/Featuers/home/presentation/mange/Home_Cubit/home_cubit_cubit.dart';
import 'package:coffee_app/Featuers/home/presentation/view/widget/custom_catogery.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = List.generate(
      20,
      (index) => 'Item ${index + 1}',
    );
    return BlocBuilder<HomeCubitCubit, HomeCubitState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubitCubit>();
        if (state is HomeCubitLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeCubitSuccess) {
          return GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 20,
            childAspectRatio: 0.75,
            children: cubit.homeProducts
                .map((product) => CustomCatogery(productModel: product))
                .toList(),
          );
        } else {
          return const Center(
            child: Text("Something went wrong ,\n please try again later"),
          );
        }
      },
    );
  }
}
