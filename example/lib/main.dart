import 'package:flutter/material.dart';
import 'package:pablito_ds/pablito_ds.dart';
import 'screens/atoms_showcase.dart';
import 'screens/molecules_showcase.dart';
import 'screens/organisms_showcase.dart';
import 'screens/templates_showcase.dart';
import 'screens/pages_showcase.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pablito DS Showcase',
      theme: DesignTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      routes: {
        '/atoms': (context) => const AtomsShowcase(),
        '/molecules': (context) => const MoleculesShowcase(),
        '/organisms': (context) => const OrganismsShowcase(),
        '/templates': (context) => const TemplatesShowcase(),
        '/pages': (context) => const PagesShowcase(),
      },
    );
  }
}
