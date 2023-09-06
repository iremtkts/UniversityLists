import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_lists/core/service/view_model/university_view_model.dart';
import 'package:university_lists/screen/home/view/home_screen.dart';
import 'package:university_lists/screen/tabs/view_model/favorite_universities_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UniversityListsViewModel()),
        ChangeNotifierProvider(
            create: (context) => FavoriteUniversitiesViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
