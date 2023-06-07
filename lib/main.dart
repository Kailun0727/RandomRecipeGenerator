import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:random_recipe_generator/firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:random_recipe_generator/recipe.dart';
import 'package:random_recipe_generator/recipeBasicInfo.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          RecipeBasicInfoPage.routeName : (context) => RecipeBasicInfoPage(),
        },


        home: RecipePage(),
      debugShowCheckedModeBanner: false,
    );


  }
}

