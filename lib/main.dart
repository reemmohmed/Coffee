import 'package:coffee_app/Featuers/OnBoarding/presentation/view/on_boarding.dart';
import 'package:coffee_app/Featuers/home/presentation/mange/Home_Cubit/home_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_KEY']!,
  );
  runApp(const CoffeeApp());
}

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubitCubit()..getData(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnBoarding(),
      ),
    );
  }
}
