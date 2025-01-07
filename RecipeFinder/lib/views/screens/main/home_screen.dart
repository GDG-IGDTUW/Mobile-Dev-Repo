import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../pages/main_page/main_page_vm.dart';
import '../../widgets/menu_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          leading: MenuButton(),
          title: const Text("Recipe Finder"),
        ),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Find Recipes Based on Ingredients",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  "Enter an ingredient and discover delicious recipes!",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () =>
                      Provider.of<MainPageVM>(context, listen: false)
                          .setScreen(ScreenType.findRecipes),
                  child: Text("Get Started"),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
