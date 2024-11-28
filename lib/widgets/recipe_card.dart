import 'package:flutter/material.dart';
import '../screens/recipe_details_screen.dart';

class RecipeCard extends StatelessWidget {
  final Map<String, dynamic> recipe;

  const RecipeCard({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(
          recipe['name'] ?? 'No Name',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('Cuisine: ${recipe['cuisine'] ?? 'Unknown'}'),
        trailing: Text('⭐ ${recipe['rating'] ?? 'N/A'}'),
        onTap: () {
          // Navigate to the Recipe Details Screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecipeDetailsScreen(recipe: recipe),
            ),
          );
        },
      ),
    );
  }
}
