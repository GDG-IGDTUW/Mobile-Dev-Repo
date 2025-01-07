import 'package:flutter/material.dart';
import '../../screens/main/home_screen.dart';
import '../../screens/main/ingredient_input_screen.dart';

enum ScreenType { home, findRecipes }

class MainPageVM extends ChangeNotifier {
  ScreenType _screenType = ScreenType.home;

  ScreenType get screenType => _screenType;

  void setScreen(ScreenType screenType) {
    _screenType = screenType;
    notifyListeners();
  }

  Widget getScreen() {
    switch (_screenType) {
      case ScreenType.home:
        return HomeScreen();
      case ScreenType.findRecipes:
        return IngredientInputScreen();
    }
  }
}
