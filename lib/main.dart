import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_assessment/presentation/bloc/grocery_bloc.dart';
import 'package:project_assessment/presentation/bloc/grocery_event.dart';
import 'package:project_assessment/presentation/pages/splash_screen.dart';
import 'package:project_assessment/dependency_injection.dart';

void main() {
  setup(); // Initialize dependency injection
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GroceryBloc(getIt())..add(LoadGroceries()), // Initialize GroceryBloc with the repository from GetIt
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
