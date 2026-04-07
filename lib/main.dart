import 'package:cat_directory_app/core/themes/default_theme.dart';
import 'package:cat_directory_app/domain/presentation/pages/list_breeds.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: DefaultTheme().theme,

      home: ListBreedsPage(),
    );
  }
}
