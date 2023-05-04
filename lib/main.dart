import 'package:bantuin/screens/home/home_pages.dart';
import 'package:bantuin/screens/splash/splash_screen.dart';
import 'package:bantuin/utils/routes.dart';
import 'package:bantuin/view_models/note_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/auth/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bantuin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      // home: const SplashScreen(),
    );
  }
}

//coba