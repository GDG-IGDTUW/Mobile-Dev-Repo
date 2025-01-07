import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RecipeDisplayPage extends StatefulWidget {
  @override
  _RecipeDisplayPageState createState() => _RecipeDisplayPageState();
}

class _RecipeDisplayPageState extends State<RecipeDisplayPage> {
  late Future<List<dynamic>> _recipes;

  Future<List<dynamic>> fetchRecipes(String ingredient) async {
    final url = "https://www.themealdb.com/api/json/v1/1/filter.php?i=$ingredient";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['meals']?.take(3)?.toList() ?? [];
    } else {
      throw Exception("Failed to load recipes");
    }
  }

  @override
  Widget build(BuildContext context) {
    final String ingredient = ModalRoute.of(context)!.settings.arguments as String;
    _recipes = fetchRecipes(ingredient);

    return Scaffold(
      appBar: AppBar(title: Text("Recipes for $ingredient")),
      body: FutureBuilder<List<dynamic>>(
        future: _recipes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No recipes found for $ingredient"));
          } else {
            final recipes = snapshot.data!;
            return DefaultTabController(
              length: recipes.length,
              child: Column(
                children: [
                  TabBar(
                    tabs: recipes.map((recipe) => Tab(text: recipe['strMeal'])).toList(),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: recipes.map((recipe) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(recipe['strMealThumb'], height: 200),
                              SizedBox(height: 20),
                              Text(
                                recipe['strMeal'],
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  // Open detailed recipe page
                                },
                                child: Text("View Details"),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
