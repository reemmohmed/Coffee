import 'package:coffee_app/Featuers/OnBoarding/presentation/view/widget/custom_on_boarding.dart';
import 'package:coffee_app/Featuers/home/presentation/mange/Home_Cubit/home_cubit_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});
  static const double hpad = 16;
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubitCubit, HomeCubitState>(
      listener: (context, state) {
        if (state is HomeCubitSuccess) {
          print("🎉 Data fetched successfully in OnBoarding!");
        } else if (state is HomeCubitError) {
          print("❌ Error while fetching data");
        }
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: const CustomOnBoarding(),
        ),
      ),
    );
  }
}
