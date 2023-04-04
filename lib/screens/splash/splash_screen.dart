import 'package:bantuin/screens/home/home_pages.dart';
import 'package:bantuin/widgets/bottom_navigation/bottom_menu.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //create button to navigate to home
      child: Center(
        child: ElevatedButton(
          onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return BottomMenu(
              currentTab: 0,
              currentScreen: HomePages(),
            );
          }));
        },
          child: const Text('Go to Home'),
        ),
      ),
    );
  }
}