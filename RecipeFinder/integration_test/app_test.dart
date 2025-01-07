import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:recipe_app/main.dart';
import 'package:recipe_app/views/pages/recipe_display_page.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('As a user, I should be able to find new potato recipe', () {
    testWidgets('Go to recipe page', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(MyApp());

      // Go to the Enter Ingredient screen.
      await tester.tap(find.byKey(const Key('menu-button')));
      await tester.pumpAndSettle(); // Waiting for the drawer to open.
      await tester.tap(find.byKey(const Key('find-recipes-page-button')));
      await tester.pumpAndSettle(); // Waiting for the drawer to close.

      // Finding recipe by the ingredient 'Potato'
      await tester.enterText(
          find.byKey(const Key('ingredient-textfield')), 'Potato');
      await tester.tap(find.byKey(const Key('find-recipes-button')));
      await tester.pumpAndSettle();

      // Making sure we land on the recipe page.
      expect(find.byType(RecipeDisplayPage), findsOne);

      // Note: Not going to check whether potato recipe appear,
      // as it depends on availability of recipe from backend API.
      // Keeping it simple for now.
    });
  });
}
