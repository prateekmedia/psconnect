import 'package:flutter/material.dart';

import 'package:psconnect/utils/utils.dart';
import 'package:psconnect/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.indigo,
        ),
        primarySwatch: Colors.indigo,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.dark,
          primarySwatch: Colors.indigo[300]!.materialColor,
        ),
        primarySwatch: Colors.indigo[300]!.materialColor,
      ),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
