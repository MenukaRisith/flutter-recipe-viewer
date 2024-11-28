class FavouritesManager {
  static final List<Map<String, dynamic>> _favourites = [];

  // Get the list of favorite recipes
  static List<Map<String, dynamic>> getFavourites() {
    return _favourites;
  }

  // Add or remove a recipe from the favorites list
  static void toggleFavourite(Map<String, dynamic> recipe) {
    if (_favourites.contains(recipe)) {
      _favourites.remove(recipe); // Remove if it already exists
    } else {
      _favourites.add(recipe); // Add if it doesn't exist
    }
  }

  // Check if a recipe is marked as favorite
  static bool isFavourite(Map<String, dynamic> recipe) {
    return _favourites.contains(recipe);
  }
}
