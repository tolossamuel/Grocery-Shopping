import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Make sure you import this
import 'package:grocery_shopping/features/grocery/presentation/UI/homeScreen/detail_page.dart';
import 'package:grocery_shopping/features/grocery/presentation/UI/homeScreen/home_screen.dart';
import 'package:grocery_shopping/features/grocery/presentation/bloc/product_bloc.dart';
import 'injection.dart' as di;
// Add this import

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setUpLocator(); // Ensure your dependencies are set up
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.locator<ProductBloc>(), // Get the bloc from GetIt
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/detail': (context) => const DetailPage(),
        },
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
