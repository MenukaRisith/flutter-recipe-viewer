import 'package:flutter/material.dart';
import '../data/favourites_manager.dart';
import '../widgets/recipe_card.dart';

class FavouritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favourites = FavouritesManager.getFavourites();

    return Scaffold(
      appBar: AppBar(title: Text('Favourites')),
      body: favourites.isEmpty
          ? Center(child: Text('No favorites added yet!'))
          : ListView.builder(
        itemCount: favourites.length,
        itemBuilder: (context, index) {
          final recipe = favourites[index];
          return RecipeCard(recipe: recipe);
        },
      ),
    );
  }
}
