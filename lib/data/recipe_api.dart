import 'dart:convert';
import 'package:http/http.dart' as http;

class RecipeAPI {
  static const String baseUrl = 'https://dummyjson.com/recipes';

  static Future<List<dynamic>> fetchRecipes() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final recipes = data['recipes'] as List<dynamic>;

      // Filter out recipes with null values for important fields
      return recipes.where((recipe) {
        return recipe['name'] != null &&
            recipe['thumbnail'] != null &&
            recipe['cuisine'] != null;
      }).toList();
    } else {
      throw Exception('Failed to fetch recipes');
    }
  }
}
