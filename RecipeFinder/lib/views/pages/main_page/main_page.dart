import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/menu_button.dart';
import 'main_page_vm.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainPageVM>(builder: (context, viewModel, widget) {
      return Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Recipe Finder',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              _menuTile(
                viewModel: viewModel,
                key: const Key('home-page-button'),
                icon: Icons.home,
                title: 'Home',
                screenType: ScreenType.home,
              ),
              _menuTile(
                viewModel: viewModel,
                key: const Key('find-recipes-page-button'),
                icon: Icons.search,
                title: 'Find Recipes',
                screenType: ScreenType.findRecipes,
              ),
            ],
          ),
        ),
        body: viewModel.getScreen(),
      );
    });
  }

  Widget _menuTile({
    required MainPageVM viewModel,
    required Key? key,
    required IconData icon,
    required String title,
    required ScreenType screenType,
  }) {
    return ListTile(
      key: key,
      leading: Icon(icon),
      title: Text(title),
      selected: viewModel.screenType == screenType,
      onTap: () {
        viewModel.setScreen(screenType);
        Navigator.pop(context);
      },
    );
  }
}
