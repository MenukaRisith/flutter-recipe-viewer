import 'package:flutter/material.dart';
import '../data/favourites_manager.dart';
import 'favourites_screen.dart';

class RecipeDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> recipe;

  const RecipeDetailsScreen({required this.recipe});

  @override
  _RecipeDetailsScreenState createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {
  late bool isFavourite;

  @override
  void initState() {
    super.initState();
    isFavourite = FavouritesManager.isFavourite(widget.recipe);
  }

  void toggleFavourite() {
    setState(() {
      isFavourite = !isFavourite;
      FavouritesManager.toggleFavourite(widget.recipe);
    });

    // Show SnackBar with feedback and navigation option
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isFavourite
              ? 'Added to Favorites! Tap to view favorites.'
              : 'Removed from Favorites!',
        ),
        duration: Duration(seconds: 2),
        action: isFavourite
            ? SnackBarAction(
          label: 'Go to Favorites',
          onPressed: () {
            // Navigate to Favorites Screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FavouritesScreen(),
              ),
            );
          },
        )
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe['name'] ?? 'No Name'),
        actions: [
          IconButton(
            icon: Icon(
              isFavourite ? Icons.favorite : Icons.favorite_border,
              color: isFavourite ? Colors.red : null,
            ),
            onPressed: toggleFavourite,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.recipe['name'] ?? 'No Name',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Cuisine: ${widget.recipe['cuisine'] ?? 'Unknown'}'),
            SizedBox(height: 10),
            Text(
              'Ingredients:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...?widget.recipe['ingredients']?.map<Widget>(
                  (ingredient) => Text('- $ingredient'),
            )?.toList() ?? [Text('No Ingredients Provided')],
            SizedBox(height: 10),
            Text(
              'Instructions:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...?widget.recipe['instructions']?.map<Widget>(
                  (instruction) => Text(
                '${widget.recipe['instructions'].indexOf(instruction) + 1}. $instruction',
              ),
            )?.toList() ?? [Text('No Instructions Provided')],
          ],
        ),
      ),
    );
  }
}
