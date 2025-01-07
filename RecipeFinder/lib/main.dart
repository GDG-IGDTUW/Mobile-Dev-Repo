import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/views/pages/main_page/main_page.dart';
import 'package:recipe_app/views/pages/main_page/main_page_vm.dart';
import 'package:recipe_app/views/pages/recipe_display_page.dart';
import 'package:recipe_app/views/screens/main/ingredient_input_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Finder',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          listTileTheme: const ListTileThemeData().copyWith(
            selectedColor: Colors.blueAccent,
          )),
      initialRoute: '/',
      routes: {
        '/': (context) => ChangeNotifierProvider(
            create: (BuildContext context) {
              return MainPageVM();
            },
            child: MainPage()),
        '/recipes': (context) => RecipeDisplayPage(),
      },
    );
  }
}
