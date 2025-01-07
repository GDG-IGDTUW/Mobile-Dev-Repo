import 'package:flutter/material.dart';

import '../../widgets/menu_button.dart';

class IngredientInputScreen extends StatefulWidget {
  @override
  _IngredientInputScreenState createState() => _IngredientInputScreenState();
}

class _IngredientInputScreenState extends State<IngredientInputScreen> {
  final TextEditingController _controller = TextEditingController();

  void _searchRecipes() {
    if (_controller.text.isNotEmpty) {
      Navigator.pushNamed(
        context,
        '/recipes',
        arguments: _controller.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          leading: MenuButton(),
          title: const Text("Enter Ingredient"),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                key: const Key('ingredient-textfield'),
                controller: _controller,
                decoration: InputDecoration(
                  labelText: "Main Ingredient",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                key: const Key('find-recipes-button'),
                onPressed: _searchRecipes,
                child: Text("Find Recipes"),
              ),
            ],
          ),
        ))
      ],
    );
  }
}
