import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bantuin/screens/home/home_pages.dart';
import 'package:bantuin/widgets/bottom_navigation/bottom_menu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Widget textFlicker = Container(
    alignment: Alignment.center,
    width: 300.0,
    child: DefaultTextStyle(
      textAlign: TextAlign.center,
      style: GoogleFonts.josefinSans(
        textStyle: const TextStyle(
          fontSize: 40,
          color: Color.fromARGB(255, 237, 247, 246),
          shadows: [
            Shadow(
              blurRadius: 15.0,
              color: Color.fromARGB(255, 15, 244, 179),
              offset: Offset(0, 0),
            ),
            Shadow(
              blurRadius: 20.0,
              color: Color.fromARGB(255, 15, 244, 179),
              offset: Offset(0, 0),
            ),
          ],
        ),
      ),
      child: AnimatedTextKit(
        pause: const Duration(milliseconds: 1500),
        totalRepeatCount: 5,
        repeatForever: true,
        animatedTexts: [
          FlickerAnimatedText('WELCOME IN'),
          FlickerAnimatedText('BANTU.IN'),
        ],
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 150,
            width: MediaQuery.of(context).size.width - 100,
            child: textFlicker,
          ),
          Container(
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
          ),
        ],
      ),
    );
  }
}
