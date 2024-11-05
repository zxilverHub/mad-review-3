import 'package:assignment5/screens/expenses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var lightColorScheme = ColorScheme.fromSeed(seedColor: Colors.red);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        colorScheme: lightColorScheme,
        appBarTheme: AppBarTheme(
          color: lightColorScheme.primary,
          foregroundColor: lightColorScheme.onPrimary,
        ),
        cardTheme: CardTheme(
          color: lightColorScheme.inversePrimary,
        ),
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: MyExpenses(),
    );
  }
}
