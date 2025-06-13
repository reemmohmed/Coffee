import 'package:coffee_app/Featuers/favourite/view/favourites_view.dart';
import 'package:coffee_app/Featuers/home/presentation/view/home_view.dart';
import 'package:coffee_app/Featuers/my_cart/view/order_view.dart';
import 'package:coffee_app/Featuers/profile/view/profile_view.dart';
import 'package:coffee_app/Featuers/nave_bar/presentation/mange/nave_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ionicons/ionicons.dart';

class NaveBar extends StatelessWidget {
  NaveBar({super.key});

  final List<Widget> pages = [
    HomeView(),
    FavouritesView(),
    OrderView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NaveBarCubit(),
      child: BlocBuilder<NaveBarCubit, int>(
        builder: (context, state) {
          final cubit = context.read<NaveBarCubit>();
          return Scaffold(
            body: pages[state],
            bottomNavigationBar: Container(
              height: 99, // ارتفاع 99 زي التصميم
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(24),
              child: GNav(
                tabBackgroundColor: Colors.transparent,
                gap: 8,
                activeColor: Color(0xffC67C4E), // اللون على الايقونة والنص فقط
                color: Colors.grey[600], // اللون الافتراضي
                iconSize: 24,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                duration: const Duration(milliseconds: 400),
                // أزلنا الـ tabBackgroundColor علشان الخلفية متتلونش
                onTabChange: cubit.changcurrentPage,
                tabs: const [
                  GButton(icon: Ionicons.home),
                  GButton(icon: Ionicons.heart),
                  GButton(icon: Ionicons.bag),
                  GButton(icon: Ionicons.notifications),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
