import 'package:devoir_inscription/Views/InscriptionListViews.dart';
import 'package:devoir_inscription/constants/app_constants..dart';
import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/inscriptions': (context) => const InscriptionListScreen(), // Route vers la liste des inscrits
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

