import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/favourites_screen.dart';
import 'utils/app_theme.dart';

void main() {
  runApp(RecipeViewerApp());
}

class RecipeViewerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Viewer',
      theme: appTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
        '/favourites': (context) => FavouritesScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
